//
//  City.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//
import Foundation

typealias Cities = [City]

struct City: Codable {
    let id, name, countryID, countryName: String
    let isState, stateID, stateName, stateCode: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case countryID = "country_id"
        case countryName = "country_name"
        case isState = "is_state"
        case stateID = "state_id"
        case stateName = "state_name"
        case stateCode = "state_code"
    }
}

