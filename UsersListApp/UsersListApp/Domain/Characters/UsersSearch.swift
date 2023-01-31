//
//  UsersSearch.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

extension Users.Search {
    struct Input: Codable {
        var results: Int?
        var gender: String?
        var password: String?
        var seed: String?
        var format: String?
        var nat: String?
        var page: String?
        var inc: String?
        var exc: String?
        
        init() { }
    }
}

// MARK: - Output
extension Users.Search {
    struct Output: Codable {
        let error: String?
        let info: Info?
        var results: [User]?
    }
}

// MARK: - Info
extension Users.Search {
    struct Info: Codable {
        let results, page: Int
        var seed: String
        var version: String
    }
}

// MARK: - Character
extension Users.Search {
    struct User: Codable {
        let gender, email, phone, cell: String
        let net: String?
        let name: Name
        let location: Location
        let dob: DateTime
        let registered: DateTime
        let picture: UserPicture
        
        init(){
            gender = ""
            email = ""
            phone = ""
            cell = ""
            net = ""
            name = Name()
            location = Location()
            dob = DateTime()
            registered = DateTime()
            picture = UserPicture()
        }
    }
}

// MARK: - Name
extension Users.Search.User {
    struct Name: Codable {
        let title, first, last: String
        
        init() {
            title = ""
            first = ""
            last = ""
        }
    }
}

// MARK: - Location
extension Users.Search.User {
    struct Location: Codable {
        let street: Street
        let city, state, country: String
        
        init() {
            street = Street()
            city = ""
            state = ""
            country = ""
        }
    }
}

// MARK: - Street
extension Users.Search.User.Location {
    struct Street: Codable {
        let number: Int
        let name: String
        
        init() {
            number = 0
            name = ""
        }
    }
}

// MARK: - DOB & Registered
extension Users.Search.User {
    struct DateTime: Codable {
        let date: String
        let age: Int
        
        init() {
            date = ""
            age = 0
        }
    }
}

// MARK: - Picture
extension Users.Search.User {
    struct UserPicture: Codable {
        let large, medium, thumbnail: String
        
        init() {
            large = ""
            medium = ""
            thumbnail = ""
        }
    }
}

