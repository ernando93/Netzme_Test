//
//  Items.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class Items: NSObject {
    
    var kind: String
    var id: String
    var etag: String
    var selfLink: String
    var volumeInfo: VolumeInfo?
    
    init?(dictionary: [String: Any]) {
        
        if let kind = dictionary["kind"] as? String {
            self.kind = kind
        } else {
            self.kind = ""
        }
        
        if let id = dictionary["id"] as? String {
            self.id = id
        } else {
            self.id = ""
        }
        
        if let etag = dictionary["etag"] as? String {
            self.etag = etag
        } else {
            self.etag = ""
        }
        
        if let selfLink = dictionary["selfLink"] as? String {
            self.selfLink = selfLink
        } else {
            self.selfLink = ""
        }
        
        if let volumeInfo = dictionary["volumeInfo"] as? [String: Any] {
            self.volumeInfo = VolumeInfo(dictionary: volumeInfo)
        }
    }
}
