//
//  NetworkError.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//


import Alamofire

public enum NetworkError: Error {
    case
    server,
    cannotParseResponse,
    unknown
}
