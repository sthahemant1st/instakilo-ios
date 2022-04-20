//
//  NetworkCaller.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

class NetworkCaller: APIClient {
    
    var endPoint: EndPointProtocol
    var code: Int?
    
    let disposeBag: DisposeBag
    
    var session: Session
    
    init(endPoint: EndPointProtocol) {
        self.endPoint = endPoint
        let configuration = URLSessionConfiguration.af.default
        let interceptor = Interceptor(adapter: NetworkAdapter(), retrier: NetworkRetrier())
        session = Session(configuration: configuration,
                          delegate: SessionDelegate(fileManager: .default),
                          rootQueue: .main,
                          startRequestsImmediately: true,
                          requestQueue: nil,
                          serializationQueue: nil,
                          interceptor: interceptor,
                          serverTrustManager: nil,
                          redirectHandler: nil,
                          cachedResponseHandler: nil,
                          eventMonitors: [])
        disposeBag = DisposeBag()
        
    }

    func request(withObject object: BaseRequestModel?, completion: @escaping ((Result<Data?, Error>) -> Void)) {
        
    }
    
    func rxRequest<ResponseType: Decodable>(
        withObject object: BaseRequestModel?,
        responseType: ResponseType.Type?
    ) -> Single<ResponseType> {
        
        return Single.create { emitter in
            self.session.rx
                .request(
                    self.endPoint.method,
                    self.endPoint.url!,
                    parameters: object?.getRequestParameters()
                )
                .validate(statusCode: 200...499)
                .responseData()
                .observe(on: MainScheduler.instance)
                .subscribe { [self] (response, data) in
                    print("response -=====> \(response)" )
                    print("data  =====> \(data)")
                    
                    let code = response.statusCode
                    self.code = code
                    
                    if 400 ... 499 ~= code {
                        //condition for session expire
                        if code == 403 || code == 401 {
                            emitter(.failure(NetworkError.sessionExpired))
                            return
                        }
                        emitter(.failure(self.parseErrorMessage(fromData: data)))
                    } else if 200 ... 299 ~= code {
                        print("sucess rxRequest")
                        do {
                            let decoder = JSONDecoder()
                            let decodedResult = try decoder.decode(ResponseType.self, from: data)
                            emitter(.success(decodedResult))
                        } catch let error {
                            emitter(.failure(error))
                        }
                    }
                } onError: { error in
                    print("failure rxRequest")
                    emitter(.failure(error))
                }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
        
    }
    
    func rxRequest(withObject object: BaseRequestModel?) -> Single<Data?> {
        
        return Single.create { emitter in
            self.session.rx
                .request(
                    self.endPoint.method,
                    self.endPoint.url!,
                    parameters: object?.getRequestParameters()
                )
                .validate(statusCode: 200...499)
                .responseData()
                .observe(on: MainScheduler.instance)
                .subscribe { [self] (response, data) in
                    print("response -=====> \(response)" )
                    
                    print("data  =====> \(data)")
                    let code = response.statusCode
                    self.code = code
                    if 400 ... 499 ~= code {
                        //condition for session expire
                        if code == 403 || code == 401 {
                            emitter(.failure(NetworkError.sessionExpired))
                            return
                        }
                        emitter(.failure(self.parseErrorMessage(fromData: data)))
                    } else if 200 ... 299 ~= code {
                        print("sucess rxRequest")
                        
                        emitter(.success(data))
                        
                    }
                } onError: { error in
                    print("failure rxRequest")
                    emitter(.failure(error))
                }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    // MARK: private functions
    private func parseErrorMessage(fromData data: Data) -> Error {
        do {
            // swiftlint:disable force_cast
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
            // swiftlint:enable force_cast
            if let errorMessage = (json.first?.value as? [String])?.first { // expecting the error response to be an object with a key having string array as value
                let err = NetworkError.apiError(apiMessage: errorMessage, code: "")
                return err
            } else if let errorMessage = json.first?.value as? String { // expecting the error response to be an object with a key having string as value
                let err = NetworkError.apiError(apiMessage: errorMessage, code: "")
                return err
            }
        } catch let error {
            return error
        }
        return NetworkError.apiError(apiMessage: "Unknown Error", code: "")
    }
}
