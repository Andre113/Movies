//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieDetailsPresenter: Presenter {
    weak var view: MovieDetailsView?
    
    private let movieService: MovieService
    
    //    MARK: - Obj Lifecycle
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    //    MARK: - Load Movie
    func loadMovie(movieId: Int) {
        movieService.fetchMovie(id: movieId) { (movie, error) in
            if let movie = movie {
                self.view?.setupMovie(movie: movie)
                return
            }
            
            if let error = error {
                print(error)
                return
            } 
        }
    }
}
