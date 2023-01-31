//
//  UsersSearch.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

extension Users.Search {
    struct Input: Codable {
        let results: Int?
        let gender: String?
        let password: String?
        let seed: String?
        let format: String?
        let nat: String?
        let page: String?
        let inc: String?
        let exc: String?
        
        init() {
            results = 0
            gender = ""
            password = ""
            seed = ""
            format = ""
            nat = ""
            page = ""
            inc = ""
            exc = ""
        }
    }
}

// MARK: - Output
extension Users.Search {
    struct Output: Codable {
        let error: String?
        let info: Info?
        var results: [Results]?
    }
}

// MARK: - Info
extension Users.Search {
    struct Info: Codable {
        let results, page: Int
        var seed: String
        var version: Double
    }
}

// MARK: - Results
extension Users.Search {
    struct Results: Codable {
        let offset, limit, total, count: Int
        var results: [User]
    }
}
// MARK: - Character
extension Users.Search {
    struct User: Codable {
        let gender, email, phone, cell, net: String
        let name: Name
        let location: Location
        let login: Login
        let dob: DateTime
        let registered: DateTime
        let id: Id
        let picture: UserPicture
        
        init(){
            gender = ""
            email = ""
            phone = ""
            cell = ""
            net = ""
            name = Name()
            location = Location()
            login = Login()
            dob = DateTime()
            registered = DateTime()
            id = Id()
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
        let city, state, country, postCode: String
        let coordinates: Coordinate
        let timeZone: TimeZone
        
        init() {
            street = Street()
            city = ""
            state = ""
            country = ""
            postCode = ""
            coordinates = Coordinate()
            timeZone = TimeZone()
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

// MARK: - Coordinate
extension Users.Search.User.Location {
    struct Coordinate: Codable {
        let latitude, longitude: String
        
        init() {
            latitude = ""
            longitude = ""
        }
    }
}

// MARK: - TimeZone
extension Users.Search.User.Location {
    struct TimeZone: Codable {
        let offset, description: String
        
        init() {
            offset = ""
            description = ""
        }
    }
}

// MARK: - Login
extension Users.Search.User {
    struct Login: Codable {
        let uuid, username, password, salt, md5, sha1, sha256: String
        
        init() {
            uuid = ""
            username = ""
            password = ""
            salt = ""
            md5 = ""
            sha1 = ""
            sha256 = ""
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

// MARK: - Id
extension Users.Search.User {
    struct Id: Codable {
        let nae, value: String
        
        init() {
            nae = ""
            value = ""
        }
    }
}

// MARK: - Picture
extension Users.Search.User {
    struct UserPicture: Codable {
        let large, medium, thubmnail: String
        
        init() {
            large = ""
            medium = ""
            thubmnail = ""
        }
    }
}

