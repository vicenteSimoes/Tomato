//
//  api.swift
//  Tomato
//
//  Created by Vicente Simões on 12/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//
//  Fetch data from the provided url and passing it to a callback
//
//

import Foundation

enum APIAccessException: Error {
    case URLIsEmpty
    case URLIsBad
}

func fetch(url: String, callback: @escaping (Data?) -> ()) throws {
    
    if url.trimmingCharacters(in: CharacterSet.whitespaces) == "" {
        throw APIAccessException.URLIsEmpty
    }
    
    guard let url = URL(string: url) else { throw APIAccessException.URLIsBad }

    var request: URLRequest = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("2b074c3761884f8ea3e3c7dfc7092fd1", forHTTPHeaderField: "user-key")
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    
        //let httpResponse = response as! HTTPURLResponse
        
        if(error != nil) { print("Failed to fetch url: \(request). error info: \(error!)"); return }
        guard let data = data else { print("Error unwrapping fetched data"); return }
        
        callback(data)
    }
 
    task.resume()
}
