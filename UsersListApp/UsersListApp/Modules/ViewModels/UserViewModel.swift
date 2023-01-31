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
    var userAge: String {
        return userModel.dob.age.description
    }
    
    var userImageUrl: URL? {
        return URL(string: userModel.picture.medium)
    }
    
    var userLargeImageUrl: URL? {
        return URL(string: userModel.picture.large)
    }
    
    var fullName: String {
        return "\(userModel.name.title) \(userModel.name.first) \(userModel.name.last)"
    }
    
    var emailAddress: String {
        return userModel.email
    }
    
    var formattedJoiningDate: String {
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
    
    var countryAndCity: NSAttributedString {
        return NSAttributedString(string: "\(userModel.location.country) | \(userModel.location.city)")
    }
    
    var dob: String {
        if let registeredDate = userModel.dob.date.convertToDate(withFormat: DateFormats.registerationFormat.rawValue) {
            return registeredDate.convertToString(withFormat: DateFormats.dob.rawValue)
        }
        
        return ""
    }
    
    var city: String {
        return userModel.location.city
    }
    
    var state: String {
        return userModel.location.state
    }
    
    var country: String {
        return userModel.location.country
    }
    
    var postcode: String {
        return "\(userModel.location.street.name) \(userModel.location.street.number)"
    }
}
