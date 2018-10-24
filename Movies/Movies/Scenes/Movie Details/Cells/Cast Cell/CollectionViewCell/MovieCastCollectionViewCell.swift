//
//  MovieCastCollectionViewCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCastCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var cardView: UIView?
    @IBOutlet private weak var logoImageView: UIImageView?
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var roleLabel: UILabel?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        cardView?.setAsCardView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    //    MARK: - Setup
    func setupCastMember(cast: CastMember) {
        nameLabel?.text = cast.name
        roleLabel?.text = cast.character
        
        if let path = cast.profilePathForQuality(quality: .Medium) {
            logoImageView?.downloadedFrom(link: path, callback: { (success) in
                
            })
        }
    }
}
