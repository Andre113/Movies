//
//  MoviesListPresenter.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import Foundation

class MoviesListPresenter: Presenter {
    private let movieService: MovieService
    private let genreService: GenreService
    weak var view: MoviesListView?
    
    //    MARK: - Obj Lifecycle
    init(movieService: MovieService,
         genreService: GenreService) {
        self.movieService = movieService
        self.genreService = genreService
    }
    
    //    MARK: - Load Genres
    func loadGenres() {
        genreService.fetchGenres { (genres, error) in
            if let error = error {
                return
            }
            
            self.view?.setupGenres(genres: genres)
        }
    }
    
    //    MARK: - Load Movies
    func loadMovies(for genre: Genre) {
        var movies: [Movie] = []
        for _ in 0...10 {
            movies.append(Movie())
        }
        
        view?.setupMovies(movies: movies)
    }
}
