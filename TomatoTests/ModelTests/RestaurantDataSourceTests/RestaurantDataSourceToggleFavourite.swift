//
//  RestaurantDataSourceTests.swift
//  TomatoTests
//
//  Created by Vicente Simões on 09/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import XCTest
@testable import Tomato

class RestaurantDataSourceToggleFavourite: XCTestCase {
    
    var testData = [12, 35, 44]
    var dataSource = RestaurantDataSource()
    
    override func setUp() {
        
        testData.forEach { dataSource.toggleFavourite(restaurantId: $0) }
    }
    
    override func tearDown() {
        
        testData.forEach { dataSource.toggleFavourite(restaurantId: $0) }
    }
    
    func testRestaurantDataSourceSuccess() {
        
        XCTAssertEqual(dataSource.favourites, testData)
    }
    
    func testRestaurantDataSourceSuccessToggleOnlyOne() {
        
        dataSource.toggleFavourite(restaurantId: testData[testData.count - 1])
        let _ = testData.popLast()
        XCTAssertEqual(dataSource.favourites, testData)
    }
}
