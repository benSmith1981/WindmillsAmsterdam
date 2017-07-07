/**
 *  UI testing example
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import XCTest

extension XCUIApplication {
    var isDisplayingLogin: Bool {
        //this checks if an element with this tag (the loginview tag) exists
        return otherElements["loginview"].exists
    }
    
    var isDisplayingLoggedInView: Bool {
        //this checks if an element with this tag (the loggedinview tag) exists
        return otherElements["mapview"].exists
    }
}
