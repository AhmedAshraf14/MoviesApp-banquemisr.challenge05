//
//  MovieService.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 26/03/2024.
//

import UIKit


class MovieService{
    
    static let shared = MovieService()
    
    private init() {}
    
    private let baseUrl = "https://api.themoviedb.org/3/movie/"
    private let apiKey = "95a89943de5af0ccb83f6a10a3c30c21"

    func getMoviesList(currentTab: String,completion: @escaping (Result<[Movie], ErrorMessage>) -> Void){
        
        let urlString = baseUrl + "\(currentTab)?api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let movies = self.parseJSON(from: data) else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(movies))
        }
        task.resume()
    }
    
    func downloadImage(from posterPath: String, completion: @escaping (Result<UIImage?, Error>) -> Void){
        let baseUrl = "https://image.tmdb.org/t/p/"
        let posterSize = "w500"
        
        guard let url = URL(string: baseUrl + posterSize + posterPath) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let _ = self else { return }
            
            
            if let _ = error{ return }
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{ return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            completion(.success(image))
            
        }
        task.resume()
    }
    
    private func parseJSON(from data: Data) -> [Movie]?{
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MoviesList.self, from: data)
            let moviesList = decodedData.results
            return moviesList
        } catch{
            return nil
        }
    }
}
