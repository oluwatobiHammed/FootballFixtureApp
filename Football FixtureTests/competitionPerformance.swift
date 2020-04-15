//
//  competitionPerformance.swift
//  Football FixtureTests
//
//  Created by user on 12/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import XCTest
@testable import Football_Fixture
class competitionPerformance: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        let exp = expectation(description: "server fetch")
        let competition = FBDClient.self
        competition.getCompetition(completion: { (competitions, error) in
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 10.0, handler: { (error) in
            print(error?.localizedDescription as Any)
        })
        self.measure {
 
        }
    }

}
