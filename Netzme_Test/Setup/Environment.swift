//
//  Environment.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

public enum PlistKey {
    case ApiURL

    func value() -> String {
        switch self {
        case .ApiURL:
            return "api_url"
        }
    }
}

public struct Environment {
    
    fileprivate var infoDict: [String: Any] {
        
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        switch key {
            
        case .ApiURL:
            return infoDict[PlistKey.ApiURL.value()] as! String
        }
    }
}
