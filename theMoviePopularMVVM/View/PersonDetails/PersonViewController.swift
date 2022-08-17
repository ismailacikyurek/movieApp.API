//
//  PersonViewController.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 17.08.2022.
//

import UIKit

class PersonViewController: UIViewController {
    var personId : Int?
    let viewModel : PersonViewModelProtocol = PersonViewModel()
    @IBOutlet weak var tvsCollectionView: UICollectionView!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var labelBiography: UILabel!
    @IBOutlet weak var labelPersonDepartment: UILabel!
    @IBOutlet weak var labelPersonName: UILabel!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var imageFront: UIImageView!
    var modelPersonMovieds :  PersonMoviesModel?
    var modelPersonTvs : PersonTvsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setUpDelegate(self)
        viewModel.initialize(personId: personId!)
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        tvsCollectionView.delegate = self
        tvsCollectionView.dataSource = self
    }
    
    func personShow(content : PersonModel) {
        labelPersonName.text = content.name
        labelPersonDepartment.text = content.knownForDepartment
        labelBiography.text = content.biography
        guard let urlStr = content.profilePath else { return }
        let UrlFront = "https://image.tmdb.org/t/p/w500"
        let Url = "\(UrlFront)\(urlStr)"
        imageBack.kf.setImage(with:URL(string: Url))
        imageFront.kf.setImage(with:URL(string: Url))
        imageBack.layer.opacity = 0.1
        imageFront.layer.cornerRadius = 15
    }
}
extension PersonViewController : PersonViewModelOutputProtocol {
    func showDataPersonMovies(content: PersonMoviesModel) {
        modelPersonMovieds = content
        moviesCollectionView.reloadData()
    }
    func showDataPersonTvs(content: PersonTvsModel) {
        modelPersonTvs = content
        tvsCollectionView.reloadData()
    }
    func showDataPerson(content: PersonModel) {
        personShow(content: content)
    }
}

extension PersonViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == tvsCollectionView) {
            return modelPersonTvs?.cast?.count ?? 0
        }
        return modelPersonMovieds?.cast?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "cellMovies", for: indexPath) as! PersonMoviesCollectionViewCell
        DispatchQueue.main.async { [self] in
            if let content = modelPersonMovieds?.cast?[indexPath.row] {cell.configure(content: content)}}
        
        if (collectionView == tvsCollectionView) {
            let cell2 = tvsCollectionView.dequeueReusableCell(withReuseIdentifier: "cellTvs", for: indexPath) as! PersonTvCollectionViewCell
            DispatchQueue.main.async { [self] in
                if let content = modelPersonTvs?.cast?[indexPath.row] {
                    cell2.configure(content: content)
                }
            }
            return cell2
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: moviesCollectionView.frame.width/2, height: moviesCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
}

