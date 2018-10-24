//
//  MovieCrewCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCrewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var crewCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.white
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
        
    }
}
