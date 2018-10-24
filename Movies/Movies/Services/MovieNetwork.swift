//
//  MovieNetwork.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum MovieServiceError: Equatable, Error {
    case CannotFetch(String)
}

protocol MovieService {
    func fetchMovies(genre: Genre, page: Int, completionHandler: @escaping([Movie], MovieServiceError?) -> Void)
    func fetchMovie(id: Int, completionHandler: @escaping(Movie?, MovieServiceError?) -> Void)
}

struct MovieNetwork: MovieService {
    func fetchMovies(genre: Genre, page: Int, completionHandler: @escaping([Movie], MovieServiceError?) -> Void) {
        let url = NetworkManager.baseURL + "discover/movie"
        
        var params = NetworkManager.defaultParams
        params["page"] = page
        params["sort_by"] = "popularity.desc"
        params["language"] = "en-US"
        params["include_adult"] = false
        params["with_genres"] = "\(genre.id)"
        
        NetworkManager.requestURL(method: .get, url: url, parameters: params) { (response) in
            var movies: [Movie] = []
            var error: MovieServiceError?
            
            if let responseError = response.error {
                error = MovieServiceError.CannotFetch(responseError.localizedDescription)
                completionHandler(movies, error)
                return
            }
            
            guard let data = response.data else {
                error = MovieServiceError.CannotFetch("Request returned no data")
                completionHandler(movies, error)
                return
            }
            
            do {
                movies = try JSONDecoder().decode(MovieListDecodable.self, from: data).list
                completionHandler(movies, error)
                return
            } catch let decodeError {
                error = MovieServiceError.CannotFetch(decodeError.localizedDescription)
                completionHandler(movies, error)
                return
            }
        }
    }
    
    func fetchMovie(id: Int, completionHandler: @escaping (Movie?, MovieServiceError?) -> Void) {
        let url = NetworkManager.baseURL + "movie/\(id)"
        print(url)
        
        var params = NetworkManager.defaultParams
        params["language"] = "en-US"
        
        NetworkManager.requestURL(method: .get, url: url, parameters: params) { (response) in
            var movie: Movie?
            var error: MovieServiceError?
            
            if let responseError = response.error {
                error = MovieServiceError.CannotFetch(responseError.localizedDescription)
                completionHandler(movie, error)
                return
            }
            
            guard let data = response.data else {
                error = MovieServiceError.CannotFetch("Request returned no data")
                completionHandler(movie, error)
                return
            }
            
            do {
                movie = try JSONDecoder().decode(Movie.self, from: data)
                completionHandler(movie, error)
                return
            } catch let decodeError {
                error = MovieServiceError.CannotFetch(decodeError.localizedDescription)
                completionHandler(movie, error)
                return
            }
        }
    }
}
