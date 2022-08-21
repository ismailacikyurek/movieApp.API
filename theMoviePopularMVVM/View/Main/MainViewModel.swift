//
//  MainViewModel.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//



import UIKit
import Alamofire
import Kingfisher


protocol MainViewModelProtocol {
    func initialize()
    func setUpDelegate(_ viewController: MainViewController)
    
}

protocol MainViewModelOutputProtocol {
    func showDataPopular(content: PopularModel)
    
}

class MainViewModel:NSObject {
    private let service: MovieDataServiceProtokol = MovieDataService()
    var delegate: MainViewModelOutputProtocol?
    
    func initialize() {
        theMovieDbService()
    }
    
    func theMovieDbService() {
        let urlNowDetails = "https://api.themoviedb.org/3/movie/now_playing?api_key=e1f05eb6d6888cc4a751a49802070b48&language=en-US&page=1"
        service.fethAllPosts(url: urlNowDetails) { [weak self] model in
            self?.delegate?.showDataPopular(content: model)
            
        } onFail: { error in
            print(error?.description ?? "An error occured")
        }
    }
}

extension MainViewModel: MainViewModelProtocol {
    func setUpDelegate(_ viewController: MainViewController) {
        delegate = viewController as! MainViewModelOutputProtocol
    }
    
}

