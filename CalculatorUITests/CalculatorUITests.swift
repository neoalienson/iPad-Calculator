//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Neo on 6/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
    
    // idenitifiers
    let labelAnswer = "labelAnswer"
    let button0 = "0"
    let button1 = "1"
    let button2 = "2"
    let button3 = "3"
    let button4 = "4"
    let button5 = "5"
    let button6 = "6"
    let button7 = "7"
    let button8 = "8"
    let button9 = "9"
    let buttonClear = "Clear"
    let buttonAdd = "+"
    let buttonSub = "—"
    let buttonMul = "x"
    let buttonDiv = "÷"
    let buttonEq = "="
    let buttonNeg = "±"
    let buttonDot = "."
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testButtonsDigits() {
        
        let app = XCUIApplication()
        app.buttons[button9].tap()
        app.buttons[button8].tap()
        app.buttons[button7].tap()
        app.buttons[button6].tap()
        app.buttons[button5].tap()
        app.buttons[button4].tap()
        app.buttons[button3].tap()
        app.buttons[button2].tap()
        app.buttons[button1].tap()
        app.buttons[button0].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "9876543210")
    }
    
    func testClear() {
        let app = XCUIApplication()
        app.buttons[button9].tap()
        app.buttons[buttonClear].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "0")
        
        // operator carry over
        app.buttons[button9].tap()
        app.buttons[buttonAdd].tap()
        app.buttons[buttonClear].tap()
        app.buttons[button9].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "9")
        
        // operator carry over
        app.buttons[button9].tap()
        app.buttons[buttonSub].tap()
        app.buttons[buttonClear].tap()
        app.buttons[button9].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "9")
        
        // operator carry over
        app.buttons[button9].tap()
        app.buttons[buttonMul].tap()
        app.buttons[buttonClear].tap()
        app.buttons[button9].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "9")
        
        // operator carry over
        app.buttons[button9].tap()
        app.buttons[buttonDiv].tap()
        app.buttons[buttonClear].tap()
        app.buttons[button9].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "9")
    }

    func testAddition() {
        let app = XCUIApplication()
        app.buttons[button1].tap()
        app.buttons[buttonAdd].tap()
        app.buttons[button2].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "3")
    }
    
    func testSubstraction() {
        let app = XCUIApplication()
        app.buttons[button4].tap()
        app.buttons[buttonSub].tap()
        app.buttons[button3].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "1")
    }

    func testMultiplication() {
        let app = XCUIApplication()
        app.buttons[button5].tap()
        app.buttons[buttonMul].tap()
        app.buttons[button6].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "30")
    }

    func testDivision() {
        let app = XCUIApplication()
        app.buttons[button9].tap()
        app.buttons[buttonDiv].tap()
        app.buttons[button3].tap()
        app.buttons[buttonEq].tap()
        XCTAssertEqual(app.staticTexts[labelAnswer].label, "3")
    }
    
}
