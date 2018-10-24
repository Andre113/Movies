//
//  MovieOverviewCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieOverviewCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let movie: Movie
    
    init(tableView: UITableView, movie: Movie) {
        self.tableView = tableView
        self.movie = movie
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieOverviewCell.className, bundle: nil), forCellReuseIdentifier: MovieOverviewCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieOverviewCell.className, for: indexPath) as? MovieOverviewCell else {
            return UITableViewCell()
        }
        
        cell.setupMovie(movie: movie)
        cell.bounds = CGRect(x: 0, y: 0, width: cell.bounds.width, height: 1000)
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
