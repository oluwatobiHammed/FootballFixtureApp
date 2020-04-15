//
//  Football_FixtureUITests.swift
//  Football FixtureUITests
//
//  Created by user on 11/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import XCTest

class Football_FixtureUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyPerfTest() {
        
        
        let app = XCUIApplication()
        app.tabBars.buttons["League"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["ÖFB Cup 2019/07"]/*[[".cells.staticTexts[\"ÖFB Cup 2019\/07\"]",".staticTexts[\"ÖFB Cup 2019\/07\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["FIXTURES"]/*[[".segmentedControls.buttons[\"FIXTURES\"]",".buttons[\"FIXTURES\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["TEAMS"]/*[[".segmentedControls.buttons[\"TEAMS\"]",".buttons[\"TEAMS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
 
       
        
        
    }

}
