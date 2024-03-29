//
//  MoviesListViewModel.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 28/03/2024.
//

import UIKit


class MoviesListViewModel{
    
    private var movies: [Movie] = []
    private var image = UIImage()
    
    var reloadCollectionView: (() -> Void)?
    
    func fetchMoviesList(currentTab: String){
        MovieService.shared.getMoviesList(currentTab: currentTab) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let movies):
                self.movies = movies
                self.reloadCollectionView?()
                
            case .failure(let error):
                print("error fetching movieslist \(error.localizedDescription)")
            }
        }
    }
    
    func getMovieImage(posterPath: String, completion: @escaping (UIImage?) -> Void ){
        MovieService.shared.downloadImage(from: posterPath) { [weak self] result in
            guard let _ = self else { return  }
            
            switch result{
            case .success(let image):
                completion(image)
                
            case .failure(let error):
                print("error downloading image \(error.localizedDescription)")
                completion(nil)
            }
        }
        
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie{
        return movies[index]
    }
}
