//
//  GenresListPresenter.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import Foundation

class GenresListPresenter: Presenter {
    private let genreService: GenreService
    weak var view: GenresListview?
    
    //    MARK: - Obj Lifecycle
    init(genreService: GenreService) {
        self.genreService = genreService
    }
    
    //    MARK: - Load Genres
    @objc
    func loadGenres() {
        genreService.fetchGenres { (genres, error) in
            if let error = error {
                self.view?.showError(error: error)
                return
            }
            
            self.view?.setupGenres(genres: genres)
        }
    }
}
