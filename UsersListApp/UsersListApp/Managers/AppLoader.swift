//
//  AppLoader.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation
import MBProgressHUD

class AppLoader {
    static let instance = AppLoader()
    
    private var hud: MBProgressHUD?
    
    func show(inView view: UIView) {
        self.hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud!.mode = .indeterminate
        hud!.bezelView.blurEffectStyle = .regular
    }
    
    func hide() {
        hud!.hide(animated: true)
    }
}
