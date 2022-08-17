//
//  PersonTvCollectionViewCell.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//

import UIKit
import Kingfisher

class PersonTvCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageTvs: UIImageView!
    @IBOutlet weak var labelTvsNAme: UILabel!
    
    func configure(content : CastTvs) {
        labelTvsNAme.text = content.name
        guard let urlStr = content.posterPath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageTvs.kf.setImage(with:URL(string: Url))
        imageTvs.layer.cornerRadius = 10
    }
}
