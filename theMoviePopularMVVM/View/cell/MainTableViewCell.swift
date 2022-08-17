//
//  MainTableViewCell.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var viewData: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(content: Result) {
        lblTitle.text = content.title
        lblDescription.text = content.overview
        guard let urlStr = content.posterPath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageMovie.kf.setImage(with:URL(string: Url))
        imageMovie.layer.cornerRadius = 25
        viewData.layer.cornerRadius = 13
    }
    
}
