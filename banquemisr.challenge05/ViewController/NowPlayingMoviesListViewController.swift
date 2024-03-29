//
//  MoviesListViewController.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 26/03/2024.
//

import UIKit

class NowPlayingMoviesListViewController: UIViewController {
    
    var collectionView : UICollectionView!
    var moviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        moviesListViewModel.fetchMoviesList(currentTab: "now_playing")
        moviesListViewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray6
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
    }
    
}

extension NowPlayingMoviesListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesListViewModel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = moviesListViewModel.movie(at: indexPath.item)
        cell.set(with: movie)
        
        return cell
    }
    
}

