//
//  PersonMoviesCollectionViewCell.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//

import UIKit

class PersonMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    
    func configure(content : CastMovies) {
        labelMovieName.text = content.title
        guard let urlStr = content.posterPath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageMovie.kf.setImage(with:URL(string: Url))
        imageMovie.layer.cornerRadius = 10
    }
}
