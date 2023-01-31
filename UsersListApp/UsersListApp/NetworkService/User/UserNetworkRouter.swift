//
//  UserNetworkRouter.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

enum UserNetworkRouter: NetworkRouter {
    static func getUsers(_ input: Users.Search.Input) -> NetworkRequest<Users.Search.Output> {
        let url = generateURL()
        let params = input.toObject() as? Dictionary<String, Any>
        
        return NetworkRequest(url: url, params: params, parse: {
            try? JSONDecoder().decode(Users.Search.Output.self, from: $0)
        })
    }
}
