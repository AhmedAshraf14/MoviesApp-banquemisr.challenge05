//
//  movieImageView.swift
//  banquemisr.challenge05
//
//  Created by Ahmed Ashraf on 28/03/2024.
//

import UIKit

class customMovieImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        layer.cornerRadius = 5
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
