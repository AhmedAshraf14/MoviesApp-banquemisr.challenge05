//
//  Movie.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 26/03/2024.
//

import Foundation


struct MoviesList: Codable{
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let originalLanguage: String
    let genreIds: [Int]
}
