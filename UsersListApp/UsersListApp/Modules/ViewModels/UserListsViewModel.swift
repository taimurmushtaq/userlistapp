//
//  UserListsViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import Foundation

class UserListsViewModel {
    var usersViewModelArray = [UserViewModel]()
    
    init() {
        usersViewModelArray.append(contentsOf: UserViewModel.mocArray)
    }
}

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
