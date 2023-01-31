//
//  NetworkRequest.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation
import Alamofire

typealias Parameters = [String: Any]
typealias JSON = [String: Any]
typealias ArrayOfJSON = [JSON]
typealias Headers = [String: String]


struct NetworkRequest<Output> {
    let url: URL
    let method: HTTPMethod
    let params: Parameters?
    var headers: Headers?
    let parse: (Data) -> Output?
    
    init(url: URL,
         method: HTTPMethod = .get,
         params: Parameters? = nil,
         headers: Headers? = nil,
         parse: @escaping (Data) -> Output?) {
        self.url = url
        self.method = method
        self.params = params
        self.headers = headers
        self.parse = parse
    }
    
    private var defaultHeaders: HTTPHeaders {
        return HTTPHeaders.default
    }
}

extension NetworkRequest: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: url, method: method)
        
        defaultHeaders.forEach {
            urlRequest.setValue($0.value, forHTTPHeaderField: $0.name)
        }
        
        if let headers = headers {
            headers.forEach {
                urlRequest.setValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        
        if method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
        }
        
        return urlRequest
    }
}
