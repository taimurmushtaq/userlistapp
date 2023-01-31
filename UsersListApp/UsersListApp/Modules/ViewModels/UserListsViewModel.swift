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
    
    //MARK: - Init
    let userNetworkService: UserNetworkService
    init(userNetworkService: UserNetworkService) {
        self.userNetworkService = userNetworkService
    }
}

//MARK: - API Calls
extension UserListsViewModel {
    func getUser(_ input: Users.Search.Input) {
        userNetworkService.getUsers(input) { [self] result in
            switch result {
            case .success(let output):
                
                if let error = output.error {
                    errorMessage.value = error
                } else if let results = output.results {
                    usersViewModelArray = results.map(UserViewModel.init)
                    errorMessage.value = ""
                } else {
                    errorMessage.value = NetworkError.cannotParseResponse.localizedDescription
                }
            case .failure(let error):
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
    
    func item(atIndex indexPath: IndexPath) -> UserViewModel? {
        if indexPath.row < usersViewModelArray.count {
            return usersViewModelArray[indexPath.row]
        }
        
        return nil
    }
}


