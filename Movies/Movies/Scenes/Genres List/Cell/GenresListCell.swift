//
//  GenresListCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class GenresListCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel?
    
    //    MARK: - Setup
    func setupGenre(genre: Genre) {
        nameLabel?.text = genre.name
    }
    
    //    MARK: - Selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        setSelectedAspect(selected: selected)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setSelectedAspect(selected: highlighted)
    }
    
   private func setSelectedAspect(selected: Bool) {
        if selected {
            backgroundColor = UIColor.Venomous.purple
            nameLabel?.textColor = UIColor.white
        } else {
            backgroundColor = UIColor.clear
            nameLabel?.textColor = UIColor.darkText
        }
    }
}
