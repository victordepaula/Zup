//
//  ViewController.swift
//  Zup
//
//  Created by Victor de Paula on 01/11/17.
//  Copyright © 2017 Victor de Paula. All rights reserved.
//

import UIKit
import SDWebImage
import ScalingCarousel

class ViewController: BaseViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var carousel: ScalingCarouselView!
  @IBOutlet weak var myTableView: UITableView!
  @IBOutlet weak var mySearchBox: UISearchBar!
  
  // MARK: - Variables
  
  var movieDataSource: MovieDataSource = MovieDataSource()
  var moviesResponse: MoviesResponse = MoviesResponse()
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //set Delegates
    carousel.register(UINib.init(nibName: "cardMovie", bundle: Bundle.main), forCellWithReuseIdentifier: "testeCell")
    
    // TODO mudar o nome dessa nib (View) para alguma coisa especifica
    myTableView.register(UINib(nibName: "View", bundle: nil), forCellReuseIdentifier: "cellNameMovie")
    self.configView()
    self.showLoading()
    
    // TODO person: "007" hardcode?
    self.movieDataSource.requestMovies(person: "007")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.tabBarController?.setTabBarVisible(visible: true, animated: false)
  }
  
  // MARK: - Misc
  
  func configView() {
    self.mySearchBox.delegate = self
    self.myTableView.delegate = self
    self.myTableView.dataSource = self
    self.movieDataSource.dataSourceDelegate = self
  }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    return self.moviesResponse.movies?.count ?? 0
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let movie = self.moviesResponse.movies?[indexPath.row] {
      if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
        vc.imdbId = movie.imdbID
        self.tabBarController?.setTabBarVisible(visible: false, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // TODO testeCell alterar o nome
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testeCell", for: indexPath)
    if let movie = self.moviesResponse.movies?[indexPath.row] {
      if let scalingCell = cell as? TestCollectionViewCell {
        if let movieImage = movie.posterMovie {
          if movieImage != "N/A" {
            scalingCell.imageTest.sd_setImage(with: URL(string : movieImage), completed: nil)
          }else {
            scalingCell.imageTest.image = UIImage(named: "indisponible")
          }
        }
      }
    }
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    carousel.didScroll()
    guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let movie = self.moviesResponse.movies?[indexPath.row] {
      if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
        vc.imdbId = movie.imdbID
        self.tabBarController?.setTabBarVisible(visible: false, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.moviesResponse.movies?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let movie = self.moviesResponse.movies?[indexPath.row]{
      if let cell = tableView.dequeueReusableCell(withIdentifier: "cellNameMovie", for: indexPath) as? CellNameTableViewCell {
        cell.movieNameLbl.text = movie.title
        return cell
      }
    }
    return UITableViewCell()
  }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate, UISearchDisplayDelegate {
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if let textinSearch = searchBar.text {
      let newString = NSString(string:  textinSearch).replacingCharacters(in: range, with: text)
      if  newString.characters.count >=
        3 {
        if self.checkConnectionBeforeSearch() {
          self.showLoading()
          self.movieDataSource.requestMovies(person: String(describing: newString))
        }else {
          // TODO corrigir a frase, falta pontuação
          self.showAlert(title: "Atencao", message: "Por favor verifique sua conexao com a internet!")
        }
      }
    }
    return true
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}

// MARK: - MoviesDataSourceProtocol

extension ViewController: MoviesDataSourceProtocol {
  func responseMovies(movies: [MoviesResponse]) {
    self.dismissLoading()
    self.moviesResponse = movies.first ?? MoviesResponse()
    self.carousel.reloadData()
    self.myTableView.reloadData()
  }
  func errorData(_ dataSource: GenericDataSource?, error: Error) {
    self.dismissLoading()
    self.showAlert(title: "Atencao!", message: "Alguma coisa deu errada!")
  }
  
  func responseMovieById(movies: [Movie]) {
    
    
  }
}

