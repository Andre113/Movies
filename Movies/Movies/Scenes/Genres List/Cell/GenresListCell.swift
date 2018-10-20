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
    func setupGenre(genre: Genre, selected: Bool) {
        nameLabel?.text = genre.name
        
        setSelectedAspect(selected: selected)
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
    
    //    MARK: - Selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        if selected {
            setSelectedAspect(selected: selected)
        }
    }
}
