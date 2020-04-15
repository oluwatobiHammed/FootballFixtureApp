//
//  competitionsTest.swift
//  Football FixtureTests
//
//  Created by user on 11/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import XCTest
@testable import Football_Fixture

class competitionsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSON() {
        let competition = FBDClient.self
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt"){
            if (try? Data.init(contentsOf: URL.init(fileURLWithPath: path))) != nil{
                 competition.getCompetition { (data, error) in
                     let result = data
                     XCTAssertNotNil(result, "should not be nil")
                     XCTAssertGreaterThan(result.count, 0, "should have values")
                }
               
            }else{
                XCTFail()
            }
        }else{
            XCTFail()
        }
    }
    
    func testGetCompetition(){
        let exp = expectation(description: "server fetch")
        
        let competition = FBDClient.self
        competition.getCompetition { (competitions, error) in
             XCTAssertNotNil(competitions, "competitions should not be nil")
            XCTAssertTrue(competitions.count > 0, "competitions should not be empty")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            print(error?.localizedDescription as Any)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
          
        }
    }

}
