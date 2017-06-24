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

class CalculatorState {
    var display = 0.0
    var screenWidth : Int = 16
    var decimalStart = false
    var decimalSet = false
    var decimalPlace = 0
    var stash = 0.0
    var current = 0.0
    var op = Operator.None
    
    
}

class Calculator {
    private var state = CalculatorState()
    
    init(screenWidth : Int = 16) {
        state.screenWidth = screenWidth
    }
    
    func getScreenWidth() -> Int {
        return state.screenWidth
    }
    
    func getDisplay() -> String {
        if (state.decimalStart) {
            return "\(state.display)."
        } else {
            if (state.display.truncatingRemainder(dividingBy: 1.0) > 0) {
                var str = String(format: "%f", state.display)
                str = str.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
                if (str.substring(to: str.index(after: str.startIndex)) == ".") {
                    str = "0" + str
                }
                return str
            } else {
                return "\(state.display)".replacingOccurrences(of: ".0", with: "")
            }
        }
    }
    
    private func reset() {
        state.current = 0.0
        state.display = 0.0
        state.op = .None
        state.decimalStart = false
        state.decimalSet = false
        state.decimalPlace = 0
    }
    
    @discardableResult func decimalPressed() -> String {
        if (state.decimalSet == false){
            state.decimalSet = true
        }
        
        return getDisplay()
    }
    
    @discardableResult func negativePressed() -> String {
        state.current *= -1
        state.display = state.current
        
        return getDisplay()
    }
    
    private func updateState() {
        state.stash = state.current
        state.display = state.current
        state.current = 0
    }
    
    @discardableResult func dividePressed() -> String {
        resolve()
        state.op = .Divide
        updateState()
        return getDisplay()
    }
    
    @discardableResult func multiplyPressed() -> String {
        resolve()
        state.op = .Multiply
        updateState()
        return getDisplay()
    }
    
    @discardableResult func subtractPressed() -> String {
        resolve()
        state.op = .Subtract
        updateState()
        return getDisplay()
    }
    
    @discardableResult func addPressed() -> String {
        resolve()
        state.op = .Add
        updateState()
        return getDisplay()
    }
    
    @discardableResult func clearPressed() -> String {
        reset()
        
        return getDisplay()
    }
    
    private func resolve() {
        switch state.op {
        case .None:
            return
        case .Add:
            state.current += state.stash
        case .Subtract:
            state.current = state.stash - state.current
        case .Multiply:
            state.current *= state.stash
        case .Divide:
            state.current = state.stash / state.current
        }
        
        state.stash = 0
        state.op = .None
    }
    
    @discardableResult func equalPressed() -> String {
        resolve()
        
        state.display = state.current
        
        return getDisplay()
    }
    
    @discardableResult func zeroPressed() -> String {
        if (state.decimalSet) {
            state.decimalPlace += 1
        } else {
            state.current *= 10
        }
        
        state.display = state.current
        
        return getDisplay()
    }
    
    @discardableResult func digitPressed(digit : Double) -> String {
        if (state.decimalSet) {
            state.decimalPlace += 1
            let pad = digit * pow(10, Double(state.decimalPlace * -1))
            state.current += pad
        } else {
            state.current *= 10
            state.current += digit
        }
        
        state.display = state.current
        
        return getDisplay()
    }
}
