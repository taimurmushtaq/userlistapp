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
        //let registeredDate = Date().addingTimeInterval(-1 * 24 * 60 * 60)
        
        if let registeredDate = userModel.registered.date.convertToDate(withFormat: DateFormats.registerationFormat.rawValue) {
            if registeredDate.isToday() {
                return registeredDate.convertToString(withFormat: DateFormats.todayFormat.rawValue)
            } else if registeredDate.isYesterday() {
                return registeredDate.convertToString(withFormat: DateFormats.yesterdayFormat.rawValue)
            } else if registeredDate.isInWeak() {
                return registeredDate.relativeString()
            } else {
                return registeredDate.convertToString(withFormat: DateFormats.simpleFormat.rawValue)
            }
        }
        
        return ""
    }
    
    var country: NSAttributedString {
        return NSAttributedString(string: "\(userModel.location.country) | \(userModel.location.city)")
    }
}
