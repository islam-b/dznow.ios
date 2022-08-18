//
//  AuthRemoteDAO.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 17/8/2022.
//

import Foundation
import Alamofire

class AuthRemoteDAO : AuthDAO {
    
    private let baseURL = "http://localhost:3000"
    private let client_id = "dznow_ios_app"
    private let client_secret = "FADCE39623DFA9E3FC84D5DBEC222"
    private let scope:String? = "profile"
    
    
    
    
    func login(username: String, password:String, onComplete: @escaping OnComplete<LoginResponse>) {
        let input = LoginParams(username: username,
                                password: password,
                                grant_type: "password",
                                client_id: client_id,
                                client_secret: client_secret,
                                scope: scope)
        let task = AF.request("\(baseURL)/oauth/v2/token",
                   method: .post,
                   parameters: input,
                   encoder: URLEncodedFormParameterEncoder.default) 
        task.responseDecodable(of: LoginResponse.self) { response in
            if let err = response.error {
                print(err)
                onComplete(nil, Error(message: "An error has occured"))
            } else {
                onComplete(response.value,nil)
            }
        }
    }
}
    

