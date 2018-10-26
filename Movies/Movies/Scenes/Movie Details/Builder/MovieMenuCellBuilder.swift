//
//  MovieMenuCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieMenuCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    private weak var movieDetailsDelegate: MovieDetailsDelegate?
    
    init(tableView: UITableView, movieDetailsDelegate: MovieDetailsDelegate?) {
        self.tableView = tableView
        self.movieDetailsDelegate = movieDetailsDelegate
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieMenuCell.className, bundle: nil), forCellReuseIdentifier: MovieMenuCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieMenuCell.className, for: indexPath) as? MovieMenuCell else {
            return UITableViewCell()
        }
        
        cell.movieDetailsDelegate = movieDetailsDelegate
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return 40
    }
}
