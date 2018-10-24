//
//  MovieCrewCollectionViewCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCrewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var roleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let textColor = UIColor.white
        roleLabel?.textColor = textColor
        nameLabel?.textColor = textColor
    }
    
    //    MARK: - Setup
    func setupCrewMember(crewMember: CrewMember) {
        nameLabel?.text = crewMember.name
        roleLabel?.text = crewMember.job
    }
}
