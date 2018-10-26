//
//  MovieScoreCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieScoreCell: UITableViewCell {
    
    @IBOutlet private weak var ringGraphView: RingGraphView?
    @IBOutlet private weak var scoreTitleLabel: UILabel?
    @IBOutlet private weak var scoreLabel: UILabel?
    @IBOutlet private weak var playLabel: UILabel?
    
    weak var movieDetailsDelegate: MovieDetailsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let textColor = UIColor.white
        scoreLabel?.textColor = textColor
        playLabel?.textColor = textColor
        scoreTitleLabel?.textColor = textColor
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
        if let rating = movie.rating {
            ringGraphView?.value = CGFloat(rating / 10)
            
            let convertedRating = (rating * 10) as NSNumber
            scoreLabel?.text = "\(convertedRating.getCleanNumber())%"
        }
    }
    
    //    MARK: - Action
    @IBAction func playButtonTouched(_ sender: Any) {
        if let delegate = movieDetailsDelegate {
            delegate.trailerButtonTouched(sender: self)
        }
    }
}
