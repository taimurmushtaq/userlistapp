//
//  BaseViewController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    deinit {
        print("deinit \(String(describing: self))")
    }
    
}
