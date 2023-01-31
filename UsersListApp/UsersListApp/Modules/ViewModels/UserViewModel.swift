//
//  UserViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import Foundation

struct UserViewModel {
    let userModel: Users.Search.User
    
    init(userModel: Users.Search.User) {
        self.userModel = userModel
    }
}

extension UserViewModel {
    var userImageUrl: URL? {
        return URL(string: userModel.picture.medium)
    }
    
    var fullName: String {
        return "\(userModel.name.title) \(userModel.name.first) \(userModel.name.last)"
    }
    
    var emailAddress: String {
        return userModel.email
    }
    
    var duration: String {
        let registeredDate = userModel.registered.date.convertToDate(withFormat: DateFormats.registerationFormat.rawValue)
        return registeredDate?.relativeTo() ?? ""
    }
    
    var country: NSAttributedString {
        return NSAttributedString(string: "\(userModel.location.country) | \(userModel.location.city)")
    }
}
