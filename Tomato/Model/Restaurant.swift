//
//  Restaurant.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation

struct Restaurants: Codable {
    let restaurants: [Restaurant]
    
    enum CodingKeys: String, CodingKey {
        case restaurants
    }
}

struct Restaurant: Codable {
    
    let restaurant: RestaurantAttributes
}


struct RestaurantAttributes: Codable {
    
    let id, name: String
    let url: String
    let location: Location
    let averageCostForTwo, priceRange: Int
    let currency: String
    let thumb, featuredImage: String
    let photosURL, menuURL, eventsURL: String
    let userRating: UserRating
    let hasOnlineDelivery, isDeliveringNow, hasTableBooking: Int
    let deeplink: String
    let cuisines: String
    let photos: [Photo]?
    let allReviews: [AllReview]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, location
        case averageCostForTwo = "average_cost_for_two"
        case priceRange = "price_range"
        case currency, thumb
        case featuredImage = "featured_image"
        case photosURL = "photos_url"
        case menuURL = "menu_url"
        case eventsURL = "events_url"
        case userRating = "user_rating"
        case hasOnlineDelivery = "has_online_delivery"
        case isDeliveringNow = "is_delivering_now"
        case hasTableBooking = "has_table_booking"
        case deeplink, cuisines
        case photos
        case allReviews = "all_reviews"
    }

}


struct AllReview: Codable {
    let rating, reviewText, id, ratingColor: String
    let reviewTimeFriendly, ratingText, timestamp, likes: String
    let user: User
    let commentsCount: String
    
    enum CodingKeys: String, CodingKey {
        case rating
        case reviewText = "review_text"
        case id
        case ratingColor = "rating_color"
        case reviewTimeFriendly = "review_time_friendly"
        case ratingText = "rating_text"
        case timestamp, likes, user
        case commentsCount = "comments_count"
    }
}

struct User: Codable {
    let name, zomatoHandle, foodieLevel, foodieLevelNum: String
    let foodieColor: String
    let profileURL: String
    let profileDeeplink, profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case zomatoHandle = "zomato_handle"
        case foodieLevel = "foodie_level"
        case foodieLevelNum = "foodie_level_num"
        case foodieColor = "foodie_color"
        case profileURL = "profile_url"
        case profileDeeplink = "profile_deeplink"
        case profileImage = "profile_image"
    }
}

struct Location: Codable {
    let address, locality, city, latitude: String
    let longitude, zipcode: String
    let countryID: Int
    
    enum CodingKeys: String, CodingKey {
        case address, locality, city, latitude, longitude, zipcode
        case countryID = "country_id"
    }
}

struct Photo: Codable {
    let id: String
    let url, thumbURL: String
    let user: User
    let resID, caption, timestamp, friendlyTime: String
    let width, height, commentsCount, likesCount: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case thumbURL = "thumb_url"
        case user
        case resID = "res_id"
        case caption, timestamp
        case friendlyTime = "friendly_time"
        case width, height
        case commentsCount = "comments_count"
        case likesCount = "likes_count"
    }
}

struct UserRating: Codable {
    let aggregateRating, ratingText, ratingColor, votes: String
    
    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case votes
    }
}
