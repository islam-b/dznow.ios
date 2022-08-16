//
//  NetworkService.swift
//  DzNow
//
//  Created by Mohamed Islam BOUAYACHE on 16/8/2022.
//

import Foundation
import Alamofire

struct GetNewsInput : Encodable {
    
}
 

class NewsRemoteDAO : NewsDAO {
    
    private let baseURL = "http://localhost:3000"
    
    
    func getList(onComplete: @escaping OnComplete) {
        let dataTask = AF.request("\(baseURL)/news",
                                         method: .get,
                                         parameters: GetNewsInput())
        dataTask.responseDecodable(of: [News].self)  { response in 
            if let err = response.error {
                print(err)
                onComplete(nil, Error(message: "An error has occured"))
            } else {
                onComplete(response.value,nil)
            }
        }
    }
    
     
    
}
