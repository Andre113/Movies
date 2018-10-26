//
//  MovieMenuCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieMenuCell: UITableViewCell {
    
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var markButton: UIButton!
    @IBOutlet weak var ratingButton: UIButton!
    
    weak var movieDetailsDelegate: MovieDetailsDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
    }
    
    //    MARK: - Action
    @IBAction func buttonTouched(_ sender: Any) {
        if let delegate = movieDetailsDelegate {
            delegate.menuButtonTouched(sender: sender)
        }
    }
}
