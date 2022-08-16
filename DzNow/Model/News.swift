//
//  News.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 3/8/2022.
//

import Foundation

struct Category {
    var label: String
}

struct News : Decodable {
    var id: String
    var title: String
    var categories: [String]
    var contentSnippet: String
    var creator: String
    var isoDate: String
    var link: String
    var pubDate:String
    var imageUrl: String
}

 
