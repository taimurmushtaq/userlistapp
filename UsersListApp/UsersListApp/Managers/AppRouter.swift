//
//  AppNetworkRouter.swift
//  ToDoList
//
//  Created by Taimur Mushtaq on 24/01/2023.
//

import UIKit

protocol AppNetworkRouterProtocol: AnyObject {
    var controller: UIViewController? { get set }
    init(_ controller: UIViewController?)
    
    func goBack()
    func routeToUserDefailts(userModel: Users.Search.User)
}


class AppNetworkRouter: AppNetworkRouterProtocol {
    //MARK: - Properties
    weak var controller: UIViewController?
    
    //MARK: - Init
    required init(_ controller: UIViewController?) {
        self.controller = controller
    }
    
    //MARK: - Protocol Methods
    func goBack(){
        controller?.navigationController?.popViewController(animated: true)
    }
    
    func routeToUserDefailts(userModel: Users.Search.User) {
        let nextController = AppFactory.userDetailViewController(router: self, userModel: userModel)
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}
