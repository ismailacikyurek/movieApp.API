//
//  CastCollectionViewCell.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//

import UIKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelCastName: UILabel!
    @IBOutlet weak var imageCast: UIImageView!
    func configure(content : Cast) {
        labelCastName.text = content.name
        guard let urlStr = content.profilePath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageCast.kf.setImage(with:URL(string: Url))
        imageCast.layer.cornerRadius = 10
    }
}
