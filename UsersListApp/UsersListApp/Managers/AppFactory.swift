//
//  AppFactory.swift
//  ToDoList
//
//  Created by Taimur Mushtaq on 24/01/2023.
//

import UIKit

protocol AppFactoryProtocol {
    static func usersListViewController() -> UsersListViewController
    static func userDetailViewController(router: AppNetworkRouterProtocol, userModel: Users.Search.User) -> UserDetailsViewController
}

class AppFactory: AppFactoryProtocol {
    static func usersListViewController() -> UsersListViewController {
        let viewModel = UserListsViewModel()
        let controller = UsersListViewController(viewModel: viewModel)
        controller.router = AppNetworkRouter(controller)
        
        return controller
    }
    
    static func userDetailViewController(router: AppNetworkRouterProtocol, userModel: Users.Search.User) -> UserDetailsViewController {
        let viewModel = UserDetailsViewModel(userModel: userModel)
        return UserDetailsViewController(router: router, viewModel: viewModel)
    }
}


