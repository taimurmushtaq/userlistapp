//
//  UsersNetworkRequest.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

protocol UserUsecase {
    func getUsers(_ input: Users.Search.Input, completion: @escaping (Result<Users.Search.Output, Error>) -> Void)
}

class UserNetworkService: NetworkService, UserUsecase {
    func getUsers(_ input: Users.Search.Input, completion: @escaping (Result<Users.Search.Output, Error>) -> Void) {
        let request = UserNetworkRouter.getUsers(input)
        self.request(request, completion: completion)
    }
}
