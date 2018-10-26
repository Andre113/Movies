//
//  MovieCastCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/24/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCastCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    private let castMembers: [CastMember]
    
    init(tableView: UITableView, castMembers: [CastMember]) {
        self.tableView = tableView
        self.castMembers = castMembers
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieCastCell.className, bundle: nil), forCellReuseIdentifier: MovieCastCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCastCell.className, for: indexPath) as? MovieCastCell else {
            return UITableViewCell()
        }
        
        cell.setupCastMembers(castMembers: castMembers)
        cell.bounds = CGRect(x: 0, y: 0, width: cell.bounds.width, height: 1000)
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
