//
//  MovieListCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    struct Constants {
        static let rating = "Rating:"
        static let releaseDate = "Release date:"
    }
    
    @IBOutlet private weak var logoImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var ratingLabel: UILabel?
    @IBOutlet private weak var releaseDateLabel: UILabel?
    @IBOutlet private weak var overviewTextView: UITextView?
    
    //    MARK: - Cell Lifecycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        logoImageView?.layer.cornerRadius = 5.0
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
        titleLabel?.text = movie.title
        
        let rating = movie.rating ?? 0.0
        ratingLabel?.text = "\(Constants.rating) \(rating)"
        overviewTextView?.text = movie.overview
        
        let releaseDateString = movie.releaseDate?.stringFromDateWith(format: "yyyy-MM-dd") ?? "Unknown date"
        releaseDateLabel?.text = "\(Constants.releaseDate)_\(releaseDateString)"
        
        if let path = movie.logoPathForQuality(quality: .Medium) {
            logoImageView?.downloadedFrom(link: path, callback: { (success) in
                
            })
        }
    }
}
