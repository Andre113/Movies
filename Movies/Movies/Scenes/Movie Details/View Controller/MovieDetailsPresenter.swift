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
    private let creditService: CreditService
    
    private let group: DispatchGroup
    private var movie: Movie?
    private var movieError: Error?
    private var credits: Credits?
    private var creditsError: Error?
    
    //    MARK: - Obj Lifecycle
    init(movieService: MovieService,
         creditService: CreditService) {
        
        self.movieService = movieService
        self.creditService = creditService
        self.group = DispatchGroup()
    }
    
    //    MARK: - Load
    func loadInfoForMovieId(movieId: Int) {
        movie = nil
        credits = nil
        movieError = nil
        creditsError = nil
        
        group.enter()
        loadMovie(movieId: movieId)
        
        group.enter()
        loadCredit(movieId: movieId)
        
        group.notify(queue: DispatchQueue.main) {
            if
                let movie = self.movie,
                let credits = self.credits {
                self.view?.setupInformation(movie: movie, credits: credits)
                return
            }
            
            if let movieError = self.movieError {
                self.view?.showError(error: movieError)
                return
            }
            
            if let creditsError = self.creditsError {
                self.view?.showError(error: creditsError)
                return
            }
        }
    }
    
    private func loadMovie(movieId: Int) {
        movieService.fetchMovie(id: movieId) { (movie, error) in
            self.group.leave()
            self.movie = movie
            self.movieError = error
        }
    }
    
    private func loadCredit(movieId: Int) {
        creditService.fetchCredits(movieId: movieId) { (credits, error) in
            self.group.leave()
            self.credits = credits
            self.creditsError = error
        }
    }
}
