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
        cal.zeroPressed()
        XCTAssertEqual("9876543210", cal.getAnswer())
    }
    
    func testScreenWidth() {
        let cal = Calculator()
        cal.digitPressed(digit: 1.0)
        cal.digitPressed(digit: 2.0)
        cal.digitPressed(digit: 3.0)
        cal.digitPressed(digit: 4.0)
        cal.digitPressed(digit: 5.0)
        cal.digitPressed(digit: 6.0)
        cal.digitPressed(digit: 7.0)
        cal.digitPressed(digit: 8.0)
        cal.digitPressed(digit: 9.0)
        cal.zeroPressed()
        cal.digitPressed(digit: 1.0)
        cal.digitPressed(digit: 2.0)
        cal.digitPressed(digit: 3.0)
        cal.digitPressed(digit: 4.0)
        cal.digitPressed(digit: 5.0)
        cal.digitPressed(digit: 6.0)
        cal.digitPressed(digit: 7.0)
        cal.digitPressed(digit: 8.0)
        cal.digitPressed(digit: 9.0)
        cal.zeroPressed()
        XCTAssertEqual(cal.getScreenWidth(), cal.getAnswer().count)
    }
    
    func testScreenWidthWithDecimal() {
        // Decimal does not count in the screen width
        let cal = Calculator()
        cal.digitPressed(digit: 1.0)
        cal.digitPressed(digit: 2.0)
        cal.digitPressed(digit: 3.0)
        cal.digitPressed(digit: 4.0)
        cal.digitPressed(digit: 5.0)
        cal.digitPressed(digit: 6.0)
        cal.digitPressed(digit: 7.0)
        cal.digitPressed(digit: 8.0)
        cal.digitPressed(digit: 9.0)
        cal.zeroPressed()
        cal.digitPressed(digit: 1.0)
        cal.digitPressed(digit: 2.0)
        cal.digitPressed(digit: 3.0)
        cal.digitPressed(digit: 4.0)
        cal.digitPressed(digit: 5.0)
        cal.digitPressed(digit: 6.0)
        cal.digitPressed(digit: 7.0)
        cal.digitPressed(digit: 8.0)
        cal.digitPressed(digit: 9.0)
        cal.zeroPressed()
        XCTAssertEqual(cal.getScreenWidth(), cal.getAnswer().replacingOccurrences(of: ".", with: "").count)
    }
    
    func testClear() {
        let cal = Calculator()
        cal.digitPressed(digit: 9.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 8.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 7.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 6.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 5.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 4.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 3.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 2.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.digitPressed(digit: 1.0)
        XCTAssertEqual("0", cal.clearPressed())
        cal.zeroPressed()
        XCTAssertEqual("0", cal.clearPressed())
    }
    
    func testZero() {
        let cal = Calculator()
        XCTAssertEqual("0", cal.zeroPressed())
    }
    
    func testDecimal() {
        let cal = Calculator()
        cal.decimalPressed()
        XCTAssertEqual("0.1", cal.digitPressed(digit: 1.0))
    }
    
    func testAdd() {
        let cal = Calculator()
        cal.digitPressed(digit: 1.0)
        cal.addPressed()
        cal.digitPressed(digit: 2.0)
        XCTAssertEqual("3", cal.equalPressed())
    }
    
    func testSubstract() {
        let cal = Calculator()
        cal.digitPressed(digit: 9.0)
        cal.subtractPressed()
        cal.digitPressed(digit: 8.0)
        XCTAssertEqual("1", cal.equalPressed())
    }
    
    func testMultiply() {
        let cal = Calculator()
        cal.digitPressed(digit: 3.0)
        cal.multiplyPressed()
        cal.digitPressed(digit: 2.0)
        XCTAssertEqual("6", cal.equalPressed())
    }
    
    func testDivide() {
        let cal = Calculator()
        cal.digitPressed(digit: 6.0)
        cal.dividePressed()
        cal.digitPressed(digit: 2.0)
        XCTAssertEqual("3", cal.equalPressed())
    }
    
    func testRoundUp() {
        let cal = Calculator(screenWidth: 3)
        cal.digitPressed(digit: 1.0)
        cal.dividePressed()
        cal.digitPressed(digit: 3.0)
        XCTAssertEqual("0.33", cal.equalPressed())
        cal.digitPressed(digit: 2.0)
        cal.dividePressed()
        cal.digitPressed(digit: 3.0)
        XCTAssertEqual("0.67", cal.equalPressed())
    }
    
    func testAddWithDecimal() {
        let cal = Calculator()
        cal.digitPressed(digit: 1.0)
        cal.decimalPressed()
        cal.digitPressed(digit: 2.0)
        cal.addPressed()
        cal.digitPressed(digit: 3.0)
        cal.decimalPressed()
        cal.digitPressed(digit: 4.0)
        XCTAssertEqual("3.6", cal.equalPressed())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
