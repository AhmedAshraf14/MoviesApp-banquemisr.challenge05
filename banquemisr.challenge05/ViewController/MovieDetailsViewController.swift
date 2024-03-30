//
//  MovieDetailsViewController.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 26/03/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var imageViewModel = MovieDetailsViewModel(with: nil)
    
    let movieImageView = customMovieImageView(frame: .zero)
    let movieNameLabel = customTitleLabel(textAlignment: .left, fontSize: 20)
    let movieReleaseDateLabel = customSecondaryLabel(fontSize: 14, textAlignment: .left)
    let rateImageView = UIImageView()
    let rateLabel = customSecondaryLabel(fontSize: 18, textAlignment: .left)
    let runtimeLabel = customSecondaryLabel(fontSize: 18, textAlignment: .left)
    let revenueLabel = customSecondaryLabel(fontSize: 18, textAlignment: .left)
    let genresNameLabel = customSecondaryLabel(fontSize: 18, textAlignment: .left)
    let overviewLabel = customBodyLabel(textAlignment: .left)
    

    var movieDetailsViewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.systemTeal

        addSubViews()
        layoutUI()
        configureUIElemnts()
    }
    
    func configureUIElemnts(){
        movieDetailsViewModel.fetchMovieDetails { movieDetails in
            if let posterPath = movieDetails.posterPath {
                self.imageViewModel.downloadImage(posterPath: posterPath) { image in
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                        self.movieNameLabel.text = movieDetails.title
                        self.movieReleaseDateLabel.text = movieDetails.releaseDate
                        self.rateImageView.image = UIImage(systemName: "star.fill")
                        self.rateLabel.text = String(format: "%.1f", movieDetails.voteAverage)
                        self.runtimeLabel.text = "\(movieDetails.runtime) min"
                        self.revenueLabel.text = "Revenue: \(movieDetails.revenue)$"
                        self.overviewLabel.text = movieDetails.overview
                        self.genresNameLabel.text = self.movieDetailsViewModel.setGenres(from: movieDetails.genres)
                    }
                }
            }

        }
    }
    func addSubViews(){
        view.addSubview(movieImageView)
        view.addSubview(movieNameLabel)
        view.addSubview(movieReleaseDateLabel)
        view.addSubview(rateImageView)
        view.addSubview(rateLabel)
        view.addSubview(runtimeLabel)
        view.addSubview(revenueLabel)
        view.addSubview(genresNameLabel)
        view.addSubview(overviewLabel)
    }
    
    func layoutUI(){
        let textImagePadding: CGFloat = 12
        rateImageView.translatesAutoresizingMaskIntoConstraints = false
        self.overviewLabel.numberOfLines = 6
        self.genresNameLabel.numberOfLines = 2
        self.rateImageView.tintColor = .systemYellow
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            movieImageView.widthAnchor.constraint(equalToConstant: 175),
            movieImageView.heightAnchor.constraint(equalToConstant: 275),
            
            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            movieNameLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            movieReleaseDateLabel.centerYAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 20),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            movieReleaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieReleaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            rateImageView.topAnchor.constraint(equalTo: movieReleaseDateLabel.bottomAnchor, constant: 10),
            rateImageView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            rateImageView.widthAnchor.constraint(equalToConstant: 25),
            rateImageView.heightAnchor.constraint(equalToConstant: 25),
            
            rateLabel.centerYAnchor.constraint(equalTo: rateImageView.centerYAnchor),
            rateLabel.leadingAnchor.constraint(equalTo: rateImageView.trailingAnchor, constant: 10),
            rateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rateLabel.heightAnchor.constraint(equalToConstant: 25),
            
            runtimeLabel.topAnchor.constraint(equalTo: rateImageView.bottomAnchor, constant: 20),
            runtimeLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            runtimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            runtimeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            revenueLabel.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: 20),
            revenueLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            revenueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            revenueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genresNameLabel.topAnchor.constraint(equalTo: revenueLabel.bottomAnchor, constant: 20),
            genresNameLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: textImagePadding),
            genresNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            genresNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            overviewLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 10),
            overviewLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            overviewLabel.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
}
