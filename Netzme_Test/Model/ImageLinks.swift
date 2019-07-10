//
//  ImageLinks.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class ImageLinks: NSObject {
    
    var smallThumbnail: String
    var thumbnail: String
    
    init?(dictionary: [String: Any]) {
        
        if let smallThumbnail = dictionary["smallThumbnail"] as? String {
            self.smallThumbnail = smallThumbnail
        } else {
            self.smallThumbnail = ""
        }
        
        if let thumbnail = dictionary["thumbnail"] as? String {
            self.thumbnail = thumbnail
        } else {
            self.thumbnail = ""
        }
    }
}
