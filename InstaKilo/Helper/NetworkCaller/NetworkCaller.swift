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
    let session = Session.default
    
    init(endPoint: EndPointProtocol) {
        self.endPoint = endPoint
        disposeBag = DisposeBag()
    }

    func request(withObject object: BaseRequestModel?, completion: @escaping ((Result<Data?, Error>) -> Void)) {
        
    }
    
    func rxRequest(withObject object: BaseRequestModel?) -> Single<Data?> {
        return Single.create { emitter in
            self.session.rx
                .request(self.endPoint.method, self.endPoint.url!)
                .observe(on: MainScheduler.instance)
                .subscribe(
                    onNext: { dataRequest in
                        emitter(.success(dataRequest.data))
                    },
                    onError: { error in
                        emitter(.failure(error))
                    },
                    onCompleted: nil,
                    onDisposed: nil
                ).disposed(by: self.disposeBag)
            return Disposables.create()
        }
        
    }
}
