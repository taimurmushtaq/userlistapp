//
//  UsersSearch.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation
import CoreData

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

extension Users.Search.User: ManagedObjectConvertible {
    typealias ManagedObject = UserDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let userDM = UserDM(context: context)
        userDM.gender = gender
        userDM.email = email
        userDM.phone = phone
        userDM.cell = cell
        userDM.net = net
        userDM.name = name.toManagedObject(in: context)
        userDM.location = location.toManagedObject(in: context)
        userDM.dob = dob.toManagedObject(in: context)
        userDM.registered = registered.toManagedObject(in: context)
        userDM.picture = picture.toManagedObject(in: context)
        
        return userDM
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

extension Users.Search.User.Name: ManagedObjectConvertible {
    typealias ManagedObject = NameDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let nameDM = NameDM(context: context)
        nameDM.title = title
        nameDM.first = first
        nameDM.last = last
        return nameDM
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

extension Users.Search.User.Location: ManagedObjectConvertible {
    typealias ManagedObject = LocationDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let locationDM = LocationDM(context: context)
        locationDM.street = street.toManagedObject(in: context)
        locationDM.city = city
        locationDM.state = state
        locationDM.country = country
        return locationDM
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

extension Users.Search.User.Location.Street: ManagedObjectConvertible {
    typealias ManagedObject = StreetDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let streetDM = StreetDM(context: context)
        streetDM.number = Int64(number)
        streetDM.name = name
        return streetDM
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

extension Users.Search.User.DateTime: ManagedObjectConvertible {
    typealias ManagedObject = DateDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let dateDM = DateDM(context: context)
        dateDM.date = date
        dateDM.age = Int64(age)
        return dateDM
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

extension Users.Search.User.UserPicture: ManagedObjectConvertible {
    typealias ManagedObject = UserPictureDM
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject? {
        let pictureDM = UserPictureDM(context: context)
        pictureDM.large = large
        pictureDM.medium = medium
        pictureDM.thumbnail = thumbnail
        return pictureDM
    }
}
