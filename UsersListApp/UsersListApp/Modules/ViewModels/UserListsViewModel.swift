//
//  UserListsViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import Foundation

class UserListsViewModel {
    //MARK: - Properties
    var usersViewModelArray = [UserViewModel]()
    let errorMessage = Observable("")
    let emptyMessage = Observable("")
    
    //MARK: - Init
    let userNetworkService: UserNetworkService
    init(userNetworkService: UserNetworkService) {
        self.userNetworkService = userNetworkService
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
                if let error = output.error {
                    emptyMessage.value = AppStrings.labelText.noUserFound.rawValue
                    errorMessage.value = error
                } else if let results = output.results {
                    usersViewModelArray = results.map(UserViewModel.init)
                    emptyMessage.value = ""
                    errorMessage.value = ""
                } else {
                    emptyMessage.value = AppStrings.labelText.noUserFound.rawValue
                    errorMessage.value = AppStrings.errorMessages.genericMessage.rawValue
                }
            case .failure(let error):
                emptyMessage.value = AppStrings.labelText.noUserFound.rawValue
                errorMessage.value = error.localizedDescription
            }
        }
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


