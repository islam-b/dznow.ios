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

protocol NewsDAO {
    
    typealias OnComplete = ([News]?, Error?) -> Void
    
    func getList(onComplete:  @escaping OnComplete)
    
}
