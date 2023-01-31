//
//  Dictionary+Extension.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import Foundation

extension Dictionary {
    func toJSONString() -> String? {
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(data: theJSONData,encoding: .utf8)
        }
        
        return nil
    }
    
    func toModel <T: Decodable> (ofType type: T.Type) -> T? {
        return self.toJSONString()?.toModel(ofType: T.self)
    }
}
