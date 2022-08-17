//
//  VideoCollectionViewCell.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//

import UIKit
import YouTubeiOSPlayerHelper

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var playerView: YTPlayerView!
    
   
    func configure(content : ResultVideo) {
        playerView.load(withVideoId:content.key!)
        labelTitle.text = content.name
    }
}
