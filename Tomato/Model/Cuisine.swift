//
//  City.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//
import Foundation

struct Cuisines: Codable {
    let cuisines: [Cuisine]
}

struct Cuisine: Codable {
    let cuisine: CuisineAttributes
}

struct CuisineAttributes: Codable {
    let cuisineID: Int
    let cuisineName: String
    
    enum CodingKeys: String, CodingKey {
        case cuisineID = "cuisine_id"
        case cuisineName = "cuisine_name"
    }
}
