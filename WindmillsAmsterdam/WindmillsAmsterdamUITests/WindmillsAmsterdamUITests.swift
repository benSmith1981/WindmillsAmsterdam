//
//  WindmillsAmsterdamUITests.swift
//  WindmillsAmsterdamUITests
//
//  Created by Ben Smith on 11/01/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import XCTest

class WindmillsAmsterdamUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually a good idea to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app, to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }

    func testCorrectLogin() {

        //must always launch app
        app.launch()

        //checsk the accessibility tags and tries to find on with this label
        // You can also set an accessibility tag like this, jsut change VIEW to the element you want to set:
        //  self.view.accessibilityIdentifier = "loginview"
        let chipCountTextField = app.textFields["usernamefield"]
        chipCountTextField.tap()
        //write in username
        chipCountTextField.typeText("b@test.com")
        
        //look got textfield with this ID
        let bigBlindTextField = app.textFields["passwordfield"]
        bigBlindTextField.tap()
        // Writes in password field
        bigBlindTextField.typeText("123456")

        app.buttons["loginbutton"].tap()
        //if login was successful then the logged in view should show
        //we check this by using a helper function
        XCTAssertTrue(app.isDisplayingLoggedInView)

    }
    
    func testIsShowingLoginView(){
        //must always launch app
        app.launch()
        XCTAssertTrue(app.isDisplayingLogin)

    }

}
