//
//  MainViewModel.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//



import UIKit
import Alamofire
import Kingfisher

protocol PersonViewModelProtocol {
    func initialize(personId : Int)
    func setUpDelegate(_ viewController:  PersonViewController)
}

protocol  PersonViewModelOutputProtocol {
    func showDataPerson(content: PersonModel)
    func showDataPersonMovies(content: PersonMoviesModel)
    func showDataPersonTvs(content: PersonTvsModel)
}

class  PersonViewModel:NSObject {
    private let service: MovieDataServiceProtokol = MovieDataService()
    var delegate:  PersonViewModelOutputProtocol?

    func initialize(personId : Int) {
        theMovieDbService(personId: personId)
    }
    
    func theMovieDbService(personId : Int?) {
        
        //person
        let urlPerson = "https://api.themoviedb.org/3/person/\(personId!)?api_key=e1f05eb6d6888cc4a751a49802070b48&language=en-US"
        service.fethAllPostsPerson(url: urlPerson) { [weak self] model in
            self?.delegate?.showDataPerson(content: model)
            } onFail: { error in
            print(error?.description ?? "An error occured")
        }
        
        //personMovies
        let urlPersonMovies = "https://api.themoviedb.org/3/person/\(personId!)/movie_credits?api_key=e1f05eb6d6888cc4a751a49802070b48&language=en-US"
        service.fethAllPostsPersonMovies(url: urlPersonMovies) { [weak self] model in
            self?.delegate?.showDataPersonMovies(content: model)
            } onFail: { error in
            print(error?.description ?? "An error occured")
        }
        
        //personTVs
        let urlPersonTvs = "https://api.themoviedb.org/3/person/\(personId!)/tv_credits?api_key=e1f05eb6d6888cc4a751a49802070b48&language=en-US"
        service.fethAllPostsPersonTvs(url: urlPersonTvs) { [weak self] model in
        self?.delegate?.showDataPersonTvs(content: model)
            
            } onFail: { error in
            print(error?.description ?? "An error occured")
        }
     }
}

extension  PersonViewModel:  PersonViewModelProtocol {
    func setUpDelegate(_ viewController: PersonViewController) {
        delegate = viewController as!  PersonViewModelOutputProtocol
    }
    
}

