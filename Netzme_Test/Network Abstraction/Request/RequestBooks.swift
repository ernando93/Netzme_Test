//
//  RequestBooks.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

struct RequestBooks {
    let q: String
    
}

extension RequestBooks: Request {
    var baseURL: URL {
        return URL(fileURLWithPath: kAPIURL)
    }
    
    var path: String {
        return "books/v1/volumes?q=\(q)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    typealias ResponseType = SingleDataResponse<Results>
}
