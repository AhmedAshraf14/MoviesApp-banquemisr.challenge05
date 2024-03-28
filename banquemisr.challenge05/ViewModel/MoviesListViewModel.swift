//
//  MoviesListViewModel.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 28/03/2024.
//

import Foundation


class MoviesListViewModel{
    
    private var movies: [Movie] = []
    
    var reloadCollectionView: (() -> Void)?
    
    func fetchMoviesList(currentTab: String){
        MovieService.shared.getMoviesList(currentTab: currentTab) { result in
            switch result{
            case .success(let movies):
                self.movies = movies
                self.reloadCollectionView?()
                
            case .failure(let error):
                print("error fetching movieslist \(error.localizedDescription)")
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
