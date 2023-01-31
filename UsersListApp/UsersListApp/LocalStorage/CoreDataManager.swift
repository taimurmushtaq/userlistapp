//
//  CoreDataManager.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UsersListApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    init() {
        clearAllUsers()
    }
}

extension CoreDataManager {
    func clearAllUsers() {
        for user in fetchUsers() {
            persistentContainer.viewContext.delete(user)
        }
        saveContext()
    }
    
    func saveUsers(array: [Users.Search.User]) {
        let context = persistentContainer.viewContext
        
        _ = array.map({ user in user.toManagedObject(in: context) })
        
        saveContext()
    }
    
    func fetchUsers() -> [UserDM] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDM")
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest) as? [UserDM] ?? []
        } catch {
            return []
        }
    }
    
    func fetchUsers(page: Int, limit: Int) -> [UserDM] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDM")
        fetchRequest.fetchLimit = limit
        fetchRequest.fetchOffset = (page - 1) * limit
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest) as? [UserDM] ?? []
        } catch {
            return []
        }
    }
}
