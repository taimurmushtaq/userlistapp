//
//  AppStrings.swift
//  ToDoList
//
//  Created by Taimur Mushtaq on 27/01/2023.
//

import Foundation

enum AppStrings {
    enum labelText: String {
        case noUserFound = "No User Found"
        case loadingData = "Loading Data..."
    }
    
    enum errorMessages: String {
        case genericMessage = "Something went wrong. Please try again in few min"
    }
    
    enum controllerTitles: String {
        case usersList = "Users List"
    }
}
