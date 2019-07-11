//
//  Results.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class Results: NSObject {
    
    var kind: String
    var totalItems: Int
    var items = [Items]()
    
    init?(dictionary: [String: Any]) {
        
        if let kind = dictionary["kind"] as? String {
            self.kind = kind
        } else {
            self.kind = ""
        }
        
        if let totalItems = dictionary["totalItems"] as? Int {
            self.totalItems = totalItems
        } else {
            self.totalItems = 0
        }
        
        if let items = dictionary["items"] as? [[String: Any]] {
            for data in items {
                self.items.append(Items(dictionary: data)!)
            }
        }
    }
}

extension Results: ResponseDataConvertible {
    convenience init?(rawData: Any) {
        
        if let dictionary = rawData as? [String: Any] {
            self.init(dictionary: dictionary)
        } else {
            return nil
        }
    }
}

extension Results {
    enum ItemsResult {
        case success(Results)
        case failure(Error)
    }
    
    static func getItems(withQ q: String,
                         completionHandler: @escaping(ItemsResult) -> Void) {
        RequestBooks(q: q).send() { result in
            
            switch result {
                
            case .success(let response):
                if let items = response.resultData {
                    completionHandler(.success(items))
                } else {
                    completionHandler(.failure(RequestError.invalidReturnedJSON))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
