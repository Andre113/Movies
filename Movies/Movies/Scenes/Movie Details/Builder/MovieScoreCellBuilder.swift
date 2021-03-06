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
    private let movie: Movie
    private weak var movieDetailsDelegate: MovieDetailsDelegate?
    
    init(tableView: UITableView,
         movie: Movie,
         movieDetailsDelegate: MovieDetailsDelegate?) {
        self.tableView = tableView
        self.movie = movie
        self.movieDetailsDelegate = movieDetailsDelegate
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieScoreCell.className, bundle: nil), forCellReuseIdentifier: MovieScoreCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieScoreCell.className, for: indexPath) as? MovieScoreCell else {
            return UITableViewCell()
        }
        
        cell.setupMovie(movie: movie)
        cell.movieDetailsDelegate = movieDetailsDelegate
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
