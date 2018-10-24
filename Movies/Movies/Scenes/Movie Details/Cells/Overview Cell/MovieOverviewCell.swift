//
//  MovieOverviewCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieOverviewCell: UITableViewCell {
    
    struct Constants {
        static let initialHeight: CGFloat = 40
    }
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var overviewTextView: UITextView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let textColor = UIColor.white
        titleLabel?.textColor = textColor
        overviewTextView?.textColor = textColor
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
        overviewTextView?.text = movie.overview
    }
}
