//
//  teamTest.swift
//  Football FixtureTests
//
//  Created by user on 13/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import XCTest
@testable import Football_Fixture
class teamTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSON() {
        let team = FBDClient.self
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "teamJSON", ofType: "txt"){
            if (try? Data.init(contentsOf: URL.init(fileURLWithPath: path))) != nil{
                team.getTeam (competitionId: 2021,completion: { (data, error)in
                    let result = data
                    XCTAssertNotNil(result, "should not be nil")
                    XCTAssertGreaterThan(result.count, 0, "should have values")
                })
                
            }else{
                XCTFail()
            }
        }else{
            XCTFail()
        }
    }
    func testgetTeam() {
        let exp = expectation(description: "server fetch")
        
        let match = FBDClient.self
        match.getTeam (competitionId: 2021,completion: { (team, error) in
            XCTAssertNotNil(team, "teams should not be nil")
            XCTAssertTrue(team.count > 0, "teams should not be empty")
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 10.0) { (error) in
            print(error?.localizedDescription as Any)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        let exp = expectation(description: "server fetch")
        let competition = FBDClient.self
        competition.getTeam(competitionId: 2021,completion: { (team, error) in
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 10.0, handler: { (error) in
            print(error?.localizedDescription as Any)
        })
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
