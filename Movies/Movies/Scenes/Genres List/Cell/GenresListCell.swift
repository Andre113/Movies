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
}
