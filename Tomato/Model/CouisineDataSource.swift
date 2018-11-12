//
//  CouisineDataSource.swift
//  Tomato
//
//  Created by Vicente Simões on 12/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import Foundation

class CouisineDataSource {
    var filters: [Int] = []
    var observableData: [CuisineAttributes] = []
    let entity: SimpleEntity
        = SimpleEntity(entityName: CouisineConstants.CoreDataEntity.name.rawValue,
                       key: CouisineConstants.CoreDataEntity.key.rawValue)
    
    init() {
        fetchData()
        try! fetchDataFromApi()
    }
    
    func fetchData() {
        // get data from Core Data
        var fil: [Int] = []
        
        do { fil = try CoreDataInterface.shared.interact(withUseCase: .fetch, onEntity: self.entity) }
        catch { print(error) }
        
        filters = fil
    }
    
    func fetchDataFromApi() throws {
        // get data from Api
    }
    
    func toggleFilter(couisineId: Int){
        // make use of the existent CoreDataInterface
        var fil: [Int] = []
        let exists = filters.contains(couisineId)
        let interaction: CoreDataInterface.InteractionType = exists
            ? .toggleOff
            : .toggleOn
        
        do { fil = try CoreDataInterface.shared.interact(withUseCase: interaction,
                                                         onEntity: self.entity,
                                                         withId: couisineId)
        }
        catch { print(error) }
        
        filters = fil
    }
    
    func fetchObservableData(){
        
    }
}
