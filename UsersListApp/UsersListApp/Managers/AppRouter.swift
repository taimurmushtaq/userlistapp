//
//  AppNetworkRouter.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

protocol AppNetworkRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
    init(_ controller: UIViewController?)
    
    func routeToUserDetails(userViewModel: UserViewModel)
}


class AppNetworkRouter: AppNetworkRouterProtocol {
    //MARK: - Properties
    weak var controller: UIViewController?
    
    //MARK: - Init
    required init(_ controller: UIViewController?) {
        self.controller = controller
    }
    
    //MARK: - Protocol Methods
    func routeToUserDetails(userViewModel: UserViewModel) {
        let nextController = AppFactory.userDetailViewController(userViewModel: userViewModel)
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}


