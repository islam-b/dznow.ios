//
//  NetworkService.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 16/8/2022.
//

import Foundation
import Alamofire

struct GetNewsInput : Encodable {
    var filter: String?
}
 

class NewsRemoteDAO : NewsDAO {
    
    
    
    private let baseURL = "http://localhost:3000"
    private let authHeaders: HTTPHeaders?
    
    init() {
        let accessToken = KeychainUtils.instance().retreive(key: "access_token")
        if (accessToken != nil) {
            authHeaders = [.authorization(bearerToken: accessToken!)]
        } else {
            authHeaders = nil
        }
    }
    
    func getList(filter :String? = "", onComplete: @escaping OnComplete<[News]>) {
        let dataTask = AF.request("\(baseURL)/news",
                                         method: .get,
                                         parameters: GetNewsInput(filter: filter),
                                        headers: authHeaders
        )
        dataTask.responseDecodable(of: [News].self)  { response in 
            if let err = response.error {
                print(err)
                onComplete(nil, Error(message: "An error has occured"))
            } else {
                onComplete(response.value,nil)
            }
        }
    }
    
    func getContent(id: String, onComplete: @escaping OnComplete<String>) {
        let dataTask = AF.request("\(baseURL)/news/\(id)/content",
                                         method: .get,
                                        headers: authHeaders)
        dataTask.responseString  { response in
            if let err = response.error {
                print(err)
                onComplete(nil, Error(message: "An error has occured"))
            } else {
                onComplete(response.value,nil)
            }
        }
    }
    
     
    
}
