//
//  UserDetailsViewController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import UIKit

class UserDetailsViewController: BaseViewController {
    //MARK: - IBOutlet
    
    //MARK: - Properties
    let router: AppNetworkRouterProtocol
    let viewModel: UserDetailsViewModel
    
    //MARK: - Init
    init(router: AppNetworkRouterProtocol, viewModel: UserDetailsViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: "UserDetailsViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
