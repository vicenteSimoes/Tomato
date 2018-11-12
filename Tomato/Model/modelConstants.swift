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
        // every restaurant for the city of Lisbon, still need to filter by cuisine
        case goodUrl  = "https://developers.zomato.com/api/v2.1/search?entity_id=82&entity_type=city"
        case cuisineFilter = "&cuisines="
        case goodUrlForSingleRestaurant = "https://developers.zomato.com/api/v2.1/restaurant?res_id="
        case badUrl   = "Bad url"
        case emptyUrl = "   "
    }
    enum CoreDataEntity: String {
        case name = "Favourite"
        case key = "restaurantId"
    }
}

enum CouisineConstants {
    enum CoreDataEntity: String {
        case name = "CouisineFilter"
        case key = "couisineId"
    }
}
