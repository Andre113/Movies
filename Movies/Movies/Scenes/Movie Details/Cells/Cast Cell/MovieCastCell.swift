//
//  MovieCastCell.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCastCell: UITableViewCell {
    
    struct Constants {
        static let initialHeight: CGFloat = 60
        static let colItemHeight: CGFloat = 250
        static let colItemWidth: CGFloat = 140
    }
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var castCollectionView: UICollectionView?
    
    private var castMembers: [CastMember] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        castCollectionView?.register(UINib(nibName: MovieCastCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MovieCastCollectionViewCell.className)
        castCollectionView?.dataSource = self
        castCollectionView?.delegate = self
    }
    
    //    MARK: - Setup
    func setupCastMembers(castMembers: [CastMember]) {
        self.castMembers = castMembers
        
        castCollectionView?.reloadData()
    }
    
    //    MARK: - Size
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        let width = targetSize.width
        let height = Constants.initialHeight + Constants.colItemHeight
        
        return CGSize(width: width, height: height)
    }
}

extension MovieCastCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: MovieCastCollectionViewCell.className, for: indexPath) as? MovieCastCollectionViewCell else {
                return UICollectionViewCell()
        }
        
        cell.setupCastMember(cast: castMembers[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.colItemWidth, height: Constants.colItemHeight)
    }
}
