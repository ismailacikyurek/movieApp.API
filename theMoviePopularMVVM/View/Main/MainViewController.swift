//
//  ViewController.swift
//  theMoviePopularMVVM
//
//  Created by İSMAİL AÇIKYÜREK on 16.08.2022.
//

import UIKit
import CoreMedia

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelMostPopular: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    var movieId : Int?
    let viewModel : MainViewModelProtocol = MainViewModel()
    var modelPopular : PopularModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        viewModel.setUpDelegate(self)
        viewModel.initialize()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let nextViewController = segue.destination as? DetailsViewController
            nextViewController?.detailsId = movieId
        }
    }
}


extension MainViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)  {
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}
extension MainViewController : MainViewModelOutputProtocol {
    func showDataPopular(content: PopularModel) {
        modelPopular = content
        tableView.reloadData()
    }
}

extension MainViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelPopular?.results?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
        if let content = modelPopular?.results?[indexPath.row] {
            cell.configure(content: content)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieId = modelPopular?.results![indexPath.row].id
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    
}

