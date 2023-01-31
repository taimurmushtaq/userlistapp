//
//  ModelConvertible.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

/// Protocol to provide functionality for data model conversion.
protocol ModelConvertible {
    associatedtype Model

    func toModel() -> Model?
}
