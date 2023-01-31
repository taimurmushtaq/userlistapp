//
//  UserDetailsViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import Foundation

class UserDetailsViewModel {
    let userModel: Users.Search.User
    
    init(userModel: Users.Search.User) {
        self.userModel = userModel
    }
}
