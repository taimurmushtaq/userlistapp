//
//  UsersListViewController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit

class UsersListViewController: BaseViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var router: AppNetworkRouterProtocol!
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
        
        configureTableView()
    }
}

//MARK: - Configuration Methods
extension UsersListViewController {
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: UserTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.reloadData()
    }
}


//MARK: - UITableViewDataSource
extension UsersListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = viewModel.numberOfRows(inSection: section)

        if numberOfRows == 0 {
            tableView.setEmptyMessage(AppStrings.labelText.noTaskFound.rawValue)
        } else {
            tableView.restore()
        }

        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as! UserTableViewCell
        cell.configureCell(withViewModel: viewModel.item(atIndex: indexPath)!)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ToastManager.showMessage("TableView Row Selected")
    }
}
