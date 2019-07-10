//
//  VolumeInfo.swift
//  Netzme_Test
//
//  Created by Ernando Kasaluhe on 10/07/19.
//  Copyright © 2019 Ernando Kasaluhe. All rights reserved.
//

import Foundation

final class VolumeInfo: NSObject {
    var title: String
    var publisher: String
    var publishedDate: String
    var pageCount: Int
    var printType: String
    var categories: [String]
    var averageRating: Double
    var ratingsCount: Int
    var contentVersion: String
    var imageLinks: ImageLinks?
    var language: String
    var previewLink: String
    var infoLink: String
    var canonicalVolumeLink: String
    
    init?(dictionary: [String: Any]) {
        
        if let title = dictionary["title"] as? String {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let publisher = dictionary["publisher"] as? String {
            self.publisher = publisher
        } else {
            self.publisher = ""
        }
        
        if let publishedDate = dictionary["publishedDate"] as? String {
            self.publishedDate = publishedDate
        } else {
            self.publishedDate = ""
        }
        
        if let pageCount = dictionary["pageCount"] as? Int {
            self.pageCount = pageCount
        } else {
            self.pageCount = 0
        }
        
        if let printType = dictionary["printType"] as? String {
            self.printType = printType
        } else {
            self.printType = ""
        }
        
        if let categories = dictionary["categories"] as? [String] {
            self.categories = categories
        } else {
            self.categories = []
        }
        
        if let averageRating = dictionary["averageRating"] as? Double {
            self.averageRating = averageRating
        } else {
            self.averageRating = 0
        }
        
        if let ratingsCount = dictionary["ratingsCount"] as? Int {
            self.ratingsCount = ratingsCount
        } else {
            self.ratingsCount = 0
        }
        
        if let contentVersion = dictionary["contentVersion"] as? String {
            self.contentVersion = contentVersion
        } else {
            self.contentVersion = ""
        }
        
        if let imageLinks = dictionary["imageLinks"] as? [String: Any] {
            self.imageLinks = ImageLinks(dictionary: imageLinks)
        }
        
        if let language = dictionary["language"] as? String {
            self.language = language
        } else {
            self.language = ""
        }
        
        if let previewLink = dictionary["previewLink"] as? String {
            self.previewLink = previewLink
        } else {
            self.previewLink = ""
        }
        
        if let infoLink = dictionary["infoLink"] as? String {
            self.infoLink = infoLink
        } else {
            self.infoLink = ""
        }
        
        if let canonicalVolumeLink = dictionary["canonicalVolumeLink"] as? String {
            self.canonicalVolumeLink = canonicalVolumeLink
        } else {
            self.canonicalVolumeLink = ""
        }
    }
}
