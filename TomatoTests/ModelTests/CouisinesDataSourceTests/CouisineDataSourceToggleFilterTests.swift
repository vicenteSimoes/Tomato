//
//  CouisineDataSourceToggleFilterTests.swift
//  TomatoTests
//
//  Created by Vicente Simões on 12/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import XCTest
@testable import Tomato

class CouisineDataSourceToggleFilterTests: XCTestCase {

    var testData = [12, 35, 44]
    var dataSource = CouisineDataSource()
    
    override func setUp() {
        
        testData.forEach { dataSource.toggleFilter(couisineId: $0) }
    }
    
    override func tearDown() {
        
        testData.forEach { dataSource.toggleFilter(couisineId: $0) }
    }
    
    func testRestaurantDataSourceSuccess() {
        
        XCTAssertEqual(dataSource.filters, testData)
    }
    
    func testRestaurantDataSourceSuccessToggleOnlyOne() {
        
        dataSource.toggleFilter(couisineId: testData[testData.count - 1])
        let _ = testData.popLast()
        XCTAssertEqual(dataSource.filters, testData)
    }
}
