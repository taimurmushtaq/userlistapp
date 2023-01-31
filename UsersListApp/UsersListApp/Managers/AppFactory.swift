//
//  AppFactory.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

protocol AppFactoryProtocol {
    static func usersListViewController() -> UsersListViewController
    static func userDetailViewController( userViewModel: UserViewModel) -> UserDetailsViewController
}

class AppFactory: AppFactoryProtocol {
    static func usersListViewController() -> UsersListViewController {
        let viewModel = UserListsViewModel(userNetworkService: UserNetworkService(), coreDataManager: CoreDataManager())
        let controller = UsersListViewController(viewModel: viewModel)
        controller.router = AppNetworkRouter(controller)
        
        return controller
    }
    
    static func userDetailViewController( userViewModel: UserViewModel) -> UserDetailsViewController {
        let viewModel = UserDetailsViewModel(userViewModel: userViewModel)
        return UserDetailsViewController(viewModel: viewModel)
    }
}


