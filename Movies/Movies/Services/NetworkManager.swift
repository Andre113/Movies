//
//  NetworkManager.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import Alamofire

struct NetworkManager {
    typealias Parameters = [String: Any]
    typealias Headers = [String: String]
    typealias Method = Alamofire.HTTPMethod
    typealias CompletionHandler = (DataResponse<Any>) -> Void
    
    static let baseURL: String = Settings.shared.apiURL
    
    static let defaultParams: [String: Any] = [
        "api_key": Settings.shared.apiKey
    ]
    
    /**
     HTTP Request with JSON params
     */
    static func requestJson(method: Method, url: String, parameters: Parameters? = nil, headers: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: JSONEncoding.default
            , headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: completion)
    }
    
    /**
     HTTP Request with HTTP params
     */
    static func requestURL(method: Method, url: String, parameters: Parameters? = nil, headers: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: URLEncoding.queryString
            , headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: completion)
    }
}
