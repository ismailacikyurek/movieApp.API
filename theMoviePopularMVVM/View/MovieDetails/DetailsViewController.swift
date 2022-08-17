//
//  MovieDetailsViewController.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//

import UIKit
import Kingfisher
import Alamofire
import YouTubeiOSPlayerHelper

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var imageFront: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    var detailsId : Int?
    let viewModel : DetailsViewModelProtocol = DetailsViewModel()
    var modelVideo : VideoModel?
    var modelCast : CastModel?
    var personId : Int?
    @IBOutlet weak var videoCollectionView: UICollectionView!
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setUpDelegate(self)
        viewModel.initialize(id: detailsId!)
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPerson" {
            let nextViewController = segue.destination as? PersonViewController
            nextViewController?.personId = personId
        }
    }
    
    
}

extension DetailsViewController : DetailsViewModelOutputProtocol {
    func showDataCast(content: CastModel) {
        modelCast = content
        castCollectionView.reloadData()
    }
    
    func showDataVideo(content: VideoModel) {
        modelVideo = content
        videoCollectionView.reloadData()
        }
    
    func showDataDetails(content: DetailsModel) {
        labelMovieTitle.text = content.title
        labelSummary.text = content.overview
        guard let urlStr = content.posterPath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageBack.kf.setImage(with:URL(string: Url))
        imageFront.kf.setImage(with:URL(string: Url))
        imageBack.layer.opacity = 0.1
        imageFront.layer.cornerRadius = 15
        let voteAverage = Int(content.voteAverage!) / 2
        
        switch voteAverage {
        case 1 : imageStar.image = UIImage(named: "one")
        case 2 : imageStar.image = UIImage(named: "two")
        case 3 : imageStar.image = UIImage(named: "three")
        case 4 : imageStar.image = UIImage(named: "four")
        default: imageStar.image = UIImage(named: "five")
        }
    }
}

extension DetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == castCollectionView) {
            modelCast?.cast?.count ?? 1
        }
        return modelVideo?.results?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VideoCollectionViewCell
        DispatchQueue.main.async { [self] in
            if let content = modelVideo?.results?[indexPath.row] {cell.configure(content: content)}}
        
        if (collectionView == castCollectionView) {
            let cell2 = castCollectionView.dequeueReusableCell(withReuseIdentifier: "cellcast", for: indexPath) as! CastCollectionViewCell
            DispatchQueue.main.async { [self] in
                if let content = modelCast?.cast?[indexPath.row] {
                    cell2.configure(content: content)
                }
            }
            return cell2
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: videoCollectionView.frame.width/2, height: videoCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        personId = modelCast?.cast?[indexPath.item].id
        if personId != nil {
            performSegue(withIdentifier: "goToPerson", sender: nil)
        }
        
    }
    
}
