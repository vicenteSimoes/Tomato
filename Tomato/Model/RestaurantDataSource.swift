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
    var observableData: [Restaurant] = []
    
    init() {
        fetchData()
        fetchDataFromAPI()
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
    
    private func fetchDataFromAPI() {
        // get restaurant data
    }
    
    func fetchObservableData() {
        // get stored restaurant data (bound byViewModel)
    }
}
