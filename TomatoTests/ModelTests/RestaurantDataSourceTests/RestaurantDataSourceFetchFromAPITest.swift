//
//  RestaurantDataSourceFetchFromAPITest.swift
//  TomatoTests
//
//  Created by Vicente Simões on 12/11/2018.
//  Copyright © 2018 Vicente Simões. All rights reserved.
//

import XCTest
@testable import Tomato

class RestaurantDataSourceFetchFromAPITest: XCTestCase {
    
    var dataSource = RestaurantDataSource()

    func testSuccess() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expect = expectation(description: "wait for fetch")
        try! fetch(url: RestaurantConstants.Url.goodUrl.rawValue) { data in
            XCTAssertNotNil(data)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }
    
    func testBadUrl() {
         XCTAssertThrowsError(try fetch(url: RestaurantConstants.Url.badUrl.rawValue) { data in })
    }
    
    func testEmptyUrl(){
        XCTAssertThrowsError(try fetch(url: RestaurantConstants.Url.emptyUrl.rawValue) { data in })
    }
}
