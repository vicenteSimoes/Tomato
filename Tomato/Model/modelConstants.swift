//
//  modelConstants.swift
//  Tomato
//
//  Created by Vicente Simões on 12/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation

enum RestaurantConstants {
    enum Url: String {
        // every restaurant for the city of Lisbon
        case goodUrl  = "https://developers.zomato.com/api/v2.1/search?entity_id=82&entity_type=city"
        case badUrl   = "Bad url"
        case emptyUrl = "   "
    }
}
