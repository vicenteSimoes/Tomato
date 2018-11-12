//
//  RestaurantDataSource´.swift
//  Tomato
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RestaurantDataSource {
    
    var favourites: [Int] = []
    var observableData: Any? = nil
    
    // initially we only want to fetch the restaurants for the city of lisbon
    init() {
        fetchData()
        try! fetchDataFromAPI(multiplicity: true)
    }
    
    private func fetchData() {
        // get favourites list from core data
        var fav: [Int] = []
        
        do { fav = try CoreDataInterface.shared.interact(withUseCase: .fetch) }
        catch { print(error) }
        
        favourites = fav
    }
    
    func toggleFavourite(restaurantId: Int) {
        // toggle if a certain restaurant is favourite or not
        var fav: [Int] = []
        let exists = favourites.contains(restaurantId)
        let interaction: CoreDataInterface.InteractionType = exists
            ? .toggleOff
            : .toggleOn
        
        do { fav = try CoreDataInterface.shared.interact(withUseCase: interaction, withId: restaurantId) }
        catch { print(error) }
        
        favourites = fav
    }
    
    // if there is multiplicity then we are fetching multiple restaurants
    func fetchDataFromAPI(multiplicity: Bool, withId id: Int? = 0) throws {
        
        let url = multiplicity
            ? RestaurantConstants.Url.goodUrl.rawValue
            : RestaurantConstants.Url.goodUrlForSingleRestaurant.rawValue + String(id!)
    
        try! fetch(url: url) { data in
            
            let dataString = String(data: data!, encoding: .utf8)
            let _data = dataString?.data(using: .utf8)
            
            if let data = _data {
                
                let decoder = JSONDecoder()
                var obj: Any? = nil
                
                if multiplicity {
                    
                    obj = try! decoder.decode(Restaurants.self, from: data)
                    self.observableData = obj
                    self.observableData = self.observableData as! Restaurants
                }
                else {
                    
                    obj = try! decoder.decode(RestaurantAttributes.self, from: data)
                    self.observableData = obj
                    self.observableData = self.observableData as! RestaurantAttributes
                }
            }
        }
    }

    func fetchObservableData(data: Restaurants) {
        // get stored restaurant data (bound byViewModel)
        self.observableData = data
    }
}
