//
//  NetworkService.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation
import Alamofire

public class NetworkService: NSObject {
    // MARK: Stored Properties
    private let client: Session
    
    override public init() {
        client = Session()
        super.init()
    }
}

extension NetworkService {
    @discardableResult
    func request<V: Decodable>(_ request: NetworkRequest<V>, completion: @escaping (Swift.Result<V, Error>) -> Void) -> URLSessionTask? {
        let dataNetworkRequest = client.request(request).validate().responseDecodable(of: V.self) { response in
            switch response.result {
            case .success(let decodable):
                completion(.success(decodable))
            case .failure(let error):
                completion(.failure(error as Error))
            }
        }
        
        return dataNetworkRequest.task
    }
}





