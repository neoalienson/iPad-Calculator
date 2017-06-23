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
    private var display = 0.0
    private var screenWidth : Int
    private var decimalStart = false
    private var decimalSet = false
    private var decimalPlace = 0
    private var stash = 0.0
    private var current = 0.0
    private var op = Operator.None
    
    init(screenWidth : Int = 16) {
        self.screenWidth = screenWidth
    }
    
    func getScreenWidth() -> Int {
        return screenWidth
    }
    
    func getDisplay() -> String {
        if (decimalStart) {
            return "\(display)."
        } else {
            if (display.truncatingRemainder(dividingBy: 1.0) > 0) {
                var str = String(format: "%f", display)
                str = str.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
                return str
            } else {
                return "\(display)".replacingOccurrences(of: ".0", with: "")
            }
        }
    }
    
    private func reset() {
        self.current = 0.0
        self.display = 0.0
        self.op = .None
        self.decimalStart = false
        self.decimalSet = false
        self.decimalPlace = 0
    }
    
    @discardableResult func decimalPressed() -> String {
        if (decimalSet == false){
            decimalSet = true
        }
        
        return getDisplay()
    }
    
    @discardableResult func negativePressed() -> String {
        current *= -1
        display = current
        
        return getDisplay()
    }
    
    @discardableResult func dividePressed() -> String {
        resolve()
        
        self.op = .Divide
        stash = current
        display = current
        current = 0
        
        return getDisplay()
    }
    
    @discardableResult func multiplyPressed() -> String {
        resolve()
        
        self.op = .Multiply
        stash = current
        display = current
        current = 0
        
        return getDisplay()
    }
    
    @discardableResult func subtractPressed() -> String {
        resolve()
        
        self.op = .Subtract
        stash = current
        display = current
        current = 0
        
        return getDisplay()
    }
    
    @discardableResult func addPressed() -> String {
        resolve()
        
        self.op = .Add
        stash = current
        display = current
        current = 0
        
        return getDisplay()
    }
    
    @discardableResult func clearPressed() -> String {
        reset()
        
        return getDisplay()
    }
    
    private func resolve() {
        switch self.op {
        case .None:
            return
        case .Add:
            current += self.stash
        case .Subtract:
            current = self.stash - current
        case .Multiply:
            current *= self.stash
        case .Divide:
            current = self.stash / current
        }
        
        self.stash = 0
        self.op = .None
    }
    
    @discardableResult func equalPressed() -> String {
        resolve()
        
        display = current
        
        return getDisplay()
    }
    
    @discardableResult func zeroPressed() -> String {
        if (decimalSet) {
            decimalPlace += 1
        } else {
            current *= 10
        }
        
        display = current
        
        return getDisplay()
    }
    
    @discardableResult func digitPressed(digit : Double) -> String {
        if (decimalSet) {
            decimalPlace += 1
            let pad = digit * pow(10, Double(decimalPlace * -1))
            current += pad
        } else {
            current *= 10
            current += digit
        }
        
        display = current
        
        return getDisplay()
    }
}
