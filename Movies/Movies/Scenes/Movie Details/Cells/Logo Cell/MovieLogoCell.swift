//
//  MovieLogoCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieLogoCell: UITableViewCell {
    
    @IBOutlet private weak var bigLogoImageView: UIImageView?
    @IBOutlet private weak var smallLogoImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.textColor = UIColor.white
    }
    
    //    MARK: - Setup
    func setupMovie(movie: Movie) {
//        titleLabel?.text = movie.title
        titleLabel?.text = "The problem with most of the answers on here are that they give you as the resulting string when you don't ha The problem with most of the answers on here are that they give you as the resulting string when you don't ha"
        
        if let path = movie.logoPathForQuality(quality: .Medium) {
            smallLogoImageView?.downloadedFrom(link: path, callback: { (success) in
                
            })
        }
        
        if let path = movie.logoPathForQuality(quality: .High) {
            bigLogoImageView?.downloadedFrom(link: path, callback: { (success) in
                
            })
        }
    }
}
