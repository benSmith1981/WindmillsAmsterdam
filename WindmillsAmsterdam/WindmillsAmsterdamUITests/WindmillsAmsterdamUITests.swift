//
//  WindmillsAmsterdamUITests.swift
//  WindmillsAmsterdamUITests
//
//  Created by Ben Smith on 11/01/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import XCTest

class WindmillsAmsterdamUITests: XCTestCase {
    
    func testExample() {
        // 1
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        // 2
        let chipCountTextField = app.textFields["chip count"]
        chipCountTextField.tap()
        chipCountTextField.typeText("10")
        // 3
        let bigBlindTextField = app.textFields["big blind"]
        bigBlindTextField.tap()
        bigBlindTextField.typeText("100")
        // 4
        snapshot("01UserEntries")
        // 5
        app.buttons["what should i do"].tap()
        snapshot("02Suggestion")
    }
    
}
