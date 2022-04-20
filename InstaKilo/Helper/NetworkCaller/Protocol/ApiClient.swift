//
//  ApiClient.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation
import RxSwift

protocol APIClient {
    var endPoint: EndPointProtocol { get set }
//    var cancellableRequest: RequestCancellable { get set }
    var code: Int? { get set }
    // TODO: completion returns data which may be optimized to return decoded value
    func request(withObject object: BaseRequestModel?, completion: @escaping ((Result<Data?, Error>) -> Void))
    func rxRequest(withObject object: BaseRequestModel?) -> Single<Data?>
    func rxRequest<ResponseType: Decodable>(
        withObject object: BaseRequestModel?,
        responseType: ResponseType.Type?
    ) -> Single<ResponseType>
    //Todo: should uncomment these and make it
//    func upload(data: Data,
//                key: String,
//                type: String?,
//                progressValue: @escaping (_ progress: Progress?) -> Void,
//                completion: @escaping ((NetworkResult<Data?>) -> Void))
//    func sendMultipartData(imgObject: [String: [Data]],
//                           requestObj: BaseRequestModel?,
//                           progressValue: @escaping (_ progress: Double) -> Void,
//                           completion: @escaping ((NetworkResult<Data?>) -> Void))
}
