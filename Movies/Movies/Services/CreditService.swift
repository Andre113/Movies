//
//  CreditService.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum CreditServiceError: Equatable, Error {
    case CannotFetch(String)
}

protocol CreditService {
    func fetchCredits(movieId: Int, completionHandler: @escaping(Credits?, CreditServiceError?) -> Void)
}

struct CreditNetwork: CreditService {
    func fetchCredits(movieId: Int, completionHandler: @escaping(Credits?, CreditServiceError?) -> Void) {
        let url = NetworkManager.baseURL + "movie/\(movieId)/credits"
        print(url)
        
        let params = NetworkManager.defaultParams
        
        NetworkManager.requestURL(method: .get, url: url, parameters: params) { (response) in
            var credits: Credits?
            var error: CreditServiceError?
            
            if let responseError = response.error {
                error = CreditServiceError.CannotFetch(responseError.localizedDescription)
                completionHandler(credits, error)
                return
            }
            
            guard let data = response.data else {
                error = CreditServiceError.CannotFetch("Request returned no data")
                completionHandler(credits, error)
                return
            }
            
            do {
                credits = try JSONDecoder().decode(Credits.self, from: data)
                completionHandler(credits, error)
                return
            } catch let decodeError {
                error = CreditServiceError.CannotFetch(decodeError.localizedDescription)
                completionHandler(credits, error)
                return
            }
        }
    }
}
