//
//  AuthDAO.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 17/8/2022.
//

import Foundation


struct LoginParams : Encodable {
    var username : String
    var password : String
    var grant_type: String
    var client_id: String
    var client_secret: String
    var scope: String?
}

struct LoginResponse : Decodable {
    var access_token : String
}

protocol AuthDAO {
    
    func login(username: String, password:String,  onComplete: @escaping OnComplete<LoginResponse> )
    
}
