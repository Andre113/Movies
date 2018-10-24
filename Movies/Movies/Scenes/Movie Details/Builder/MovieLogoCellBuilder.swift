//
//  MovieLogoCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieLogoCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let movie: Movie
    
    init(tableView: UITableView, movie: Movie) {
        self.tableView = tableView
        self.movie = movie
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieLogoCell.className, bundle: nil), forCellReuseIdentifier: MovieLogoCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieLogoCell.className, for: indexPath) as? MovieLogoCell else {
            return UITableViewCell()
        }
        
        cell.setupMovie(movie: movie)
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
