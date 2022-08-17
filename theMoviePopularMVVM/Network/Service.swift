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
    func fethAllPostsPopular(url:String,onSuccess: @escaping (PopularModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsDetails(url:String,onSuccess: @escaping (DetailsModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsVideo(url:String,onSuccess: @escaping (VideoModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsCast(url:String,onSuccess: @escaping (CastModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsPerson(url:String,onSuccess: @escaping (PersonModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsPersonMovies(url:String,onSuccess: @escaping (PersonMoviesModel) -> Void, onFail: @escaping (String?) -> Void)
    func fethAllPostsPersonTvs(url:String,onSuccess: @escaping (PersonTvsModel) -> Void, onFail: @escaping (String?) -> Void)
}

//MARK: Get Datas
struct MovieDataService: MovieDataServiceProtokol {
    func fethAllPostsPersonMovies(url: String, onSuccess: @escaping (PersonMoviesModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:PersonMoviesModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsPersonTvs(url: String, onSuccess: @escaping (PersonTvsModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:PersonTvsModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsPerson(url: String, onSuccess: @escaping (PersonModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:PersonModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsCast(url: String, onSuccess: @escaping (CastModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:CastModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsVideo(url: String, onSuccess: @escaping (VideoModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:VideoModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsDetails(url: String, onSuccess: @escaping (DetailsModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:DetailsModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
    
    func fethAllPostsPopular(url: String, onSuccess: @escaping (PopularModel) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(url, method: .get).validate().responseDecodable(of:PopularModel.self) { (response) in
            guard let items =  response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}

