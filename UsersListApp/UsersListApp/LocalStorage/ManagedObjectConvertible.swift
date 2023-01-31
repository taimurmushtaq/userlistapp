//
//  ManagedObjectConvertible.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import CoreData
import Foundation

/// Protocol to provide functionality for CoreData managed object conversion.
protocol ManagedObjectConvertible {
    associatedtype ManagedObject

    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}
