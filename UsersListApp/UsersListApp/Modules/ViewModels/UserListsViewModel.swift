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
    let errorMessage = Observable("")
    let emptyMessage = Observable("")
    
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
    func getUser(_ input: Users.Search.Input) {
        emptyMessage.value = AppStrings.labelText.loadingData.rawValue
        errorMessage.value = ""
        
        userNetworkService.getUsers(input) { [self] result in
            switch result {
            case .success(let output):
                if let results = output.results {
                    coreDataManager.clearAllUsers()
                    coreDataManager.saveUsers(array: results)
                    
                    emptyMessage.value = ""
                    errorMessage.value = ""
                }
                
                loadUsersFromCoreData()
            case .failure(_):
                loadUsersFromCoreData()
            }
        }
    }
    
    func loadUsersFromCoreData(){
        let users = coreDataManager.fetchUsers()
        usersViewModelArray = users.map(UserViewModel.init)
        
        print("\n\nUsers Count: \(usersViewModelArray.count)\n\n")
        
        if usersViewModelArray.isEmpty {
            emptyMessage.value = AppStrings.labelText.noUserFound.rawValue
        }
        
        errorMessage.value = ""
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


