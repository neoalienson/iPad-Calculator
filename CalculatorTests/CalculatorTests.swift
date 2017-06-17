//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Neo on 6/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDigits() {
        let cal = Calculator()
        cal.digitPressed(digit: 9.0)
        cal.digitPressed(digit: 8.0)
        cal.digitPressed(digit: 7.0)
        cal.digitPressed(digit: 6.0)
        cal.digitPressed(digit: 5.0)
        cal.digitPressed(digit: 4.0)
        cal.digitPressed(digit: 3.0)
        cal.digitPressed(digit: 2.0)
        cal.digitPressed(digit: 1.0)
        cal.digitPressed(digit: 0.0)
        XCTAssertEqual("9876543210", cal.getAnswer())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
