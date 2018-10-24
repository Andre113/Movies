//
//  MovieCrewCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCrewCell: UITableViewCell {
    
    struct Constants {
        static let maxItensPerRow = 2
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var crewCollectionView: UICollectionView!
    
    private var crewMembers: [CrewMember] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.white
        
        crewCollectionView.register(UINib(nibName: MovieCrewCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MovieCrewCollectionViewCell.className)
        crewCollectionView.dataSource = self
        crewCollectionView.delegate = self
    }
    
    //    MARK: - Setup
    func setupCrewMembers(crewMembers: [CrewMember]) {
        self.crewMembers = crewMembers
    }
}

extension MovieCrewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: MovieCrewCollectionViewCell.className, for: indexPath) as? MovieCrewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
