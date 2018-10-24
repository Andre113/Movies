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
        static let maxItensPerRow: CGFloat = 2
        static let colSpacing: CGFloat = 5
        static let initialHeight: CGFloat = 55
        static let colItemHeight: CGFloat = 80
        static let colLineSpacing: CGFloat = 10
        static let visibleCellsAtColPerTime: CGFloat = 3
    }
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var crewCollectionView: UICollectionView?
    
    private var crewMembers: [CrewMember] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel?.textColor = UIColor.white
        
        crewCollectionView?.register(UINib(nibName: MovieCrewCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MovieCrewCollectionViewCell.className)
        crewCollectionView?.dataSource = self
        crewCollectionView?.delegate = self
    }
    
    //    MARK: - Setup
    func setupCrewMembers(crewMembers: [CrewMember]) {
        self.crewMembers = crewMembers
        
        crewCollectionView?.reloadData()
    }
    
    //    MARK: - Size
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        let width = targetSize.width
        
        let height = Constants.initialHeight +
            (Constants.colItemHeight * Constants.visibleCellsAtColPerTime) +
            (Constants.colLineSpacing * (Constants.visibleCellsAtColPerTime - 1))
        
        return CGSize(width: width, height: height)
    }
}

extension MovieCrewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: MovieCrewCollectionViewCell.className, for: indexPath) as? MovieCrewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCrewMember(crewMember: crewMembers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.frame.size.width - Constants.colSpacing
        let width = totalWidth / Constants.maxItensPerRow
        
        return CGSize(width: width, height: Constants.colItemHeight)
    }
}
