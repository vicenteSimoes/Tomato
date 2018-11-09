//
//  Search.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation


import Foundation

struct Search: Codable {
    let resultsFound, resultsStart, resultsShown: String
    let restaurants: [Restaurant]
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants
    }
}
