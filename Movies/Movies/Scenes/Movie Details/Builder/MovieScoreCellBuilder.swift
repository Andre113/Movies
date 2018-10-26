//
//  MovieScoreCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieScoreCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let movie: Movie
    
    init(tableView: UITableView, movie: Movie) {
        self.tableView = tableView
        self.movie = movie
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieScoreCell.className, bundle: nil), forCellReuseIdentifier: MovieScoreCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieScoreCell.className, for: indexPath) as? MovieScoreCell else {
            return UITableViewCell()
        }
        
        cell.setupMovie(movie: movie)
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
