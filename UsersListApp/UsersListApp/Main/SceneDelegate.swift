//
//  SceneDelegate.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        ThemeManager.configure()
        AppWindowManager.setupWindow(forScene: scene)
    }
}

