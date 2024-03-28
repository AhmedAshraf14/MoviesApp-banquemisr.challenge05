//
//  MovieCell.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 28/03/2024.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    let movieImageView = customMovieImageView(frame: .zero)
    let movieNameLabel = customTitleLabel(textAlignment: .center, fontSize: 20)
    let movieRelaseDateLabel = customSecondaryLabel(fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMovieImageView()
        configureMovieNameLabel()
        configureMovieReleaseDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with movie: Movie){
        movieNameLabel.text = movie.title
        movieRelaseDateLabel.text = movie.releaseDate
    }
    
    private func configureMovieImageView() {
        addSubview(movieImageView)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            movieImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 2),
        ])
    }
    
    private func configureMovieNameLabel() {
        addSubview(movieNameLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 12),
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureMovieReleaseDateLabel() {
        addSubview(movieRelaseDateLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieRelaseDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            movieRelaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieRelaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            movieRelaseDateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
