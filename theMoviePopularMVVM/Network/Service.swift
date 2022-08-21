//
//  Service.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//


import Foundation
import UIKit
import Alamofire


//MARK: Protocol
protocol MovieDataServiceProtokol {
    func fethAllPosts<T:Codable>(url:String,onSuccess: @escaping (T) -> Void, onFail: @escaping (String?) -> Void)
   
}

//MARK: Get Datas
struct MovieDataService: MovieDataServiceProtokol {
    func fethAllPosts<T>(url: String, onSuccess: @escaping (T) -> Void, onFail: @escaping (String?) -> Void) where T : Decodable, T : Encodable {
        AF.request(url, method: .get).validate().responseDecodable(of:T.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
    
    
