//
//  MovieListCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet private weak var logoImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var ratingLabel: UILabel?
    @IBOutlet private weak var releaseDateLabel: UILabel?
    @IBOutlet private weak var overviewTextView: UITextView?
    
    //    MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
        
    }
    
}
