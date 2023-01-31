//
//  UserListsViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

class UserListsViewModel {
    //MARK: - Properties
    var usersViewModelArray = [UserViewModel]()
    
    var isLoading = false
    let emptyMessage = Observable("")
    
    var input = Users.Search.Input()
    var seedInfo: Users.Search.Info!
    
    
    
    //MARK: - Init
    let userNetworkService: UserNetworkService
    let coreDataManager: CoreDataManager
    init(userNetworkService: UserNetworkService, coreDataManager: CoreDataManager) {
        self.userNetworkService = userNetworkService
        self.coreDataManager = coreDataManager
    }
}

//MARK: - API Calls
extension UserListsViewModel {
    func configurePagination() {
        input.results = 10
        
        if let seedInfo = seedInfo {
            input.page = (seedInfo.page+1).description
            input.seed = seedInfo.seed
        }
    }
    
    func fetchUsers() {
        isLoading = true
        emptyMessage.value = AppStrings.labelText.loadingData.rawValue
        
        configurePagination()
        userNetworkService.getUsers(input) { [self] result in
            switch result {
            case .success(let output):
                if let users = output.results {
                    coreDataManager.saveUsers(array: users)
                }
                
                if let info = output.info {
                    seedInfo = info
                }
                
                loadUsersFromCoreData()
            case .failure(_):
                loadUsersFromCoreData()
            }
        }
    }
    
    func loadUsersFromCoreData(){
        let users = coreDataManager.fetchUsers(page: seedInfo.page, limit: seedInfo.results)
        usersViewModelArray.append(contentsOf: users.map(UserViewModel.init))
                
        isLoading = false
        emptyMessage.value = usersViewModelArray.isEmpty ? AppStrings.labelText.noUserFound.rawValue : ""
    }
}

//MARK: - TableView Data Source
extension UserListsViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return usersViewModelArray.count
    }
    
    func user(atIndex indexPath: IndexPath) -> UserViewModel? {
        if indexPath.row < usersViewModelArray.count {
            return usersViewModelArray[indexPath.row]
        }
        
        return nil
    }
}


