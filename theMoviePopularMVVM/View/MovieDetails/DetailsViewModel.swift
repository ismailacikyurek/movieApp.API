//
//  DetailsViewModel.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//



import UIKit
import Alamofire
import Kingfisher

protocol DetailsViewModelProtocol {
    func initialize(id : Int)
    func setUpDelegate(_ viewController: DetailsViewController)
}

protocol DetailsViewModelOutputProtocol {
    func showDataDetails(content: DetailsModel)
    func showDataVideo(content: VideoModel)
    func showDataCast(content: CastModel)
}

class DetailsViewModel:NSObject {
    private let service: MovieDataServiceProtokol = MovieDataService()
    var delegate: DetailsViewModelOutputProtocol?
    
    func initialize(id : Int) {
        theMovieDbService(id: id)
    }
    
    func theMovieDbService(id : Int) {
        //Details
        let urlDetails = "https://api.themoviedb.org/3/movie/\(id)?api_key=e1f05eb6d6888cc4a751a49802070b48"
        service.fethAllPosts(url: urlDetails) { [weak self] model in
            self?.delegate?.showDataDetails(content: model)
            
        } onFail: { error in
            print(error?.description ?? "An error occured")
        }
        
        //Video
        let urlVideo = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=e1f05eb6d6888cc4a751a49802070b48&language=en-US"
        service.fethAllPosts(url: urlVideo) { [weak self] model in
            self?.delegate?.showDataVideo(content: model)
            
        } onFail: { error in
            print(error?.description ?? "An error occured")
        }
        //Cast
        let urlCast = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=e1f05eb6d6888cc4a751a49802070b48"
        print(urlCast)
        service.fethAllPosts(url: urlCast) { [weak self] model in
            self?.delegate?.showDataCast(content: model)
            
        } onFail: { error in
            print(error?.description ?? "An error occured")
        }
        
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    func setUpDelegate(_ viewController: DetailsViewController) {
        delegate = viewController as! DetailsViewModelOutputProtocol
    }
    
}

