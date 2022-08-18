//
//  NewsDAO.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 16/8/2022.
//

import Foundation
import Kingfisher


enum Either<First, Second> {
    case first(First), second(Second)
}

struct Error {
    var message: String
}

typealias OnComplete<T> = (T?, Error?) -> Void


protocol NewsDAO {
    
    
    func getList(filter: String?,onComplete:  @escaping OnComplete<[News]>)
    
    func getContent(id: String, onComplete: @escaping OnComplete<String>)
    
}
