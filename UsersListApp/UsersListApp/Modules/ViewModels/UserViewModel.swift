//
//  UserViewModel.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import Foundation

class UserViewModel {
    let userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
}

extension UserViewModel {
    var userImageUrl: URL? {
        return URL(string: "https://media.istockphoto.com/id/1341046662/vector/picture-profile-icon-human-or-people-sign-and-symbol-for-template-design.jpg?s=2048x2048&w=is&k=20&c=4idzCdf3pzuScohnsKP4H3fnf2cLLLqPujLmdz2hOzc=")
    }
    
    var fullName: String {
        return "Taimur Mushtaq"
    }
    
    var emailAddress: String {
        return "taimur_1989@hotmail.com"
    }
    
    var duration: String {
        return "2 days ago"
    }
    
    var country: NSAttributedString {
        return NSAttributedString(string: "Country | United Arab Emirates")
    }
}

extension UserViewModel {
    static var mocArray: [UserViewModel] = {
        var mock = [UserViewModel]()
        
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        mock.append(UserViewModel(userModel: UserModel()))
        
        return mock
    }()
}
