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
    var observableData: Restaurants? = nil
    
    init() {
        fetchData()
        try! fetchDataFromAPI()
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
    
    func fetchDataFromAPI() throws {
        
        try! fetch(url: RestaurantConstants.Url.goodUrl.rawValue) { data in
            
            let dataString = String(data: data!, encoding: .utf8)
            let _data = dataString?.data(using: .utf8)
            
            if let data = _data {
                let decoder = JSONDecoder()
                let obj = try! decoder.decode(Restaurants.self, from: data)
                self.observableData = obj
                //print("On closure \(self.observableData)")
            }
        }
    }

    func fetchObservableData(data: Restaurants) {
        // get stored restaurant data (bound byViewModel)
        self.observableData = data
    }
}
