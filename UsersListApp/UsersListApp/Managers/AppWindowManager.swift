//
//  AppWindowManager.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

enum AppWindowManager {
    static func setupWindow(forScene scene: UIScene) {
        guard let window = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: window)
        self.window?.rootViewController = BaseNavigationController(rootViewController: AppFactory.usersListViewController())
        self.window?.makeKeyAndVisible()
    }
}

extension AppWindowManager {
    static var window: UIWindow? {
        get {
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        }
        set {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window = newValue
        }
    }
}
