//
//  GenreNetwork.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum GenreServiceError: Equatable, Error {
    case CannotFetch(String)
}

protocol GenreService {
    func fetchGenres(completionHandler: @escaping([Genre], GenreServiceError?) -> Void)
}


struct GenreNetwork: GenreService {
    func fetchGenres(completionHandler: @escaping([Genre], GenreServiceError?) -> Void) {
        let url = NetworkManager.baseURL + "genre/movie/list"
        
        var params = NetworkManager.defaultParams
        params["language"] = "en-US"
        
        NetworkManager.requestURL(method: .get, url: url, parameters: params) { (response) in
            var genres: [Genre] = []
            var error: GenreServiceError?
            
            if let responseError = response.error {
                error = GenreServiceError.CannotFetch(responseError.localizedDescription)
                completionHandler(genres, error)
                return
            }
            
            guard let data = response.data else {
                error = GenreServiceError.CannotFetch("Request returned no data")
                completionHandler(genres, error)
                return
            }
            
            do {
                genres = try JSONDecoder().decode(GenreListDecodable.self, from: data).list
                completionHandler(genres, error)
                return
            } catch let decodeError as NSError {
                error = GenreServiceError.CannotFetch(decodeError.localizedDescription)
                completionHandler(genres, error)
                return
            }
        }
    }
}
