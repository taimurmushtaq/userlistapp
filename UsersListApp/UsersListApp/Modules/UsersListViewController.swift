//
//  UsersListViewController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

class UsersListViewController: BaseViewController {
    //MARK: - IBOutlet
    
    //MARK: - Properties
    var router: AppRouterProtocol!
    let viewModel: UserListsViewModel
    
    //MARK: - Init
    init(viewModel: UserListsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "UsersListViewController", bundle: .main)
        
        self.title = AppStrings.controllerTitles.usersList.rawValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
