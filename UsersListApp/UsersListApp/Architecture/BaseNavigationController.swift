//
//  BaseNavigationController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
