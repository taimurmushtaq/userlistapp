//
//  NetworkRouter.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

protocol NetworkRouter {
    static var rootURL: String { get }
    static var name: String? { get }
    static var apiVersion: String? { get }
}

extension NetworkRouter {
    static var apiVersion: String? {
        return "v1"
    }

    static var name: String? {
        return nil
    }

    static var rootURL: String {
        return NetworkConstants.baseUrl
    }

    static func generateURL(_ components: String...) -> URL {
        let urlString = URLStringGenerator.resource(name, root: rootURL, apiVersion: apiVersion)(components)
        if let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URL(string: encodedString)!
        }
        return URL(string: urlString)!
    }
}
