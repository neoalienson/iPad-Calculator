//
//  Calculator.swift
//  CalculatorCommon
//
//  Created by Neo on 6/16/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum Operator {
    case None, Add, Subtract, Multiply, Divide
}

class Calculator {
    private var screenWidth : Int
    private var decimalStart = false
    private var decimalSet = false
    private var decimalPlace = 0
    private var stash = 0.0
    private var result = 0.0
    private var op = Operator.None
    
    init(screenWidth : Int = 16) {
        self.screenWidth = screenWidth
    }
    
    func getScreenWidth() -> Int {
        return screenWidth
    }
    
    func getAnswer() -> String {
        if (decimalStart) {
            return "\(result)."
        } else {
            return "\(result)".replacingOccurrences(of: ".0", with: "")
        }
    }
    
    private func reset() {
        self.result = 0.0
        self.op = .None
        self.decimalStart = false
        self.decimalSet = false
        self.decimalPlace = 0
    }
    
    @discardableResult func decimalPressed() -> String {
        if (decimalSet == false){
            decimalSet = true
        }
        
        return getAnswer()
    }
    
    @discardableResult func negativePressed() -> String {
        result *= -1
        
        return getAnswer()
    }
    
    @discardableResult func dividePressed() -> String {
        self.op = .Divide
        return getAnswer()
    }
    
    @discardableResult func multiplyPressed() -> String {
        self.op = .Multiply
        
        return getAnswer()
    }
    
    @discardableResult func subtractPressed() -> String {
        self.op = .Subtract
        
        return getAnswer()
    }
    
    @discardableResult func clearPressed() -> String {
        reset()
        
        return getAnswer()
    }
    
    @discardableResult func equalPressed() -> String {
        self.op = .None
        
        return getAnswer()
    }
    
    @discardableResult func addPressed() -> String {
        self.op = .Add
        
        return getAnswer()
    }
    
    @discardableResult func zeroPressed() -> String {
        
        return getAnswer()
    }
    
    @discardableResult func digitPressed(digit : Double) -> String {
        if (decimalSet) {
            decimalPlace += 1
            let pad = digit * pow(10, Double(decimalPlace * -1))
            result += pad
        } else {
            result *= 10
            result += digit
        }
        return getAnswer()
    }
}
