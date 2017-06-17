//
//  Calculator.swift
//  CalculatorCommon
//
//  Created by Neo on 6/16/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Calculator {
    private var answer = "0"
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var newNumber = 0.0
    private var operatorSet = "none"
    private var decimalSet = false
    private var numberSelectedBool = false
    private var numberLenghtOne = 0.0
    private var numberLenghtTwo = 0.0
    private var decimalPlace = 0.0
    private var tempOp = "none"
    private var tempNum = 0.0
    private var allClear = 0
    private var equalSet = false
    
    func getAnswer() -> String {
        return answer
    }
    
    @discardableResult func decimalPressed() -> String {
        if (decimalSet == false){
            decimalSet = true
            doRefresh()
        }
        
        return getAnswer()
    }
    
    @discardableResult func negativePressed() -> String {
        newNumber = -1.0
        numberSelectedBool = true
        
        if (operatorSet == "none"){
            firstNumber = firstNumber * newNumber
            numberSelectedBool = false
        }else{
            secondNumber = secondNumber * newNumber
            numberSelectedBool = false
        }
        
        doRefresh()
        
        return getAnswer()
    }
    
    @discardableResult func dividePressed() -> String {
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate()
            doRefresh()
        }
        
        operatorSet = "/"
        tempOp = "/"
        decimalSet = false
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        doRefresh()
        if firstNumber >= 9999999999.0{
            answer = "\(firstNumber)"
        }else{
            answer = "\(Int(firstNumber))"
        }
        
        return getAnswer()
    }
    
    @discardableResult func multiplyPressed() -> String {
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate()
            doRefresh()
        }
        
        operatorSet = "*"
        tempOp = "*"
        decimalSet = false
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        doRefresh()
        if firstNumber >= 9999999999.0{
            answer = "\(firstNumber)"
        }else{
            answer = "\(Int(firstNumber))"
        }
        
        return getAnswer()
    }
    
    @discardableResult func subtractPressed() -> String {
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate()
            doRefresh()
        }
        
        operatorSet = "-"
        tempOp = "-"
        decimalSet = false
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        doRefresh()
        if firstNumber >= 9999999999.0{
            answer = "\(firstNumber)"
        }else{
            answer = "\(Int(firstNumber))"
        }
        
        return getAnswer()
    }
    
    @discardableResult func clearPressed() -> String {
        if (operatorSet == "none"){
            firstNumber = 0.0
            allClear = 1
        }else{
            secondNumber = 0.0
            allClear += 1
        }
        
        if (allClear == 2){
            operatorSet = "none"
            firstNumber = 0.0
        }
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        decimalSet = false
        equalSet = false
        doRefresh()
        
        return getAnswer()
    }
    
    @discardableResult func equalPressed() -> String {
        doCalculate()
        operatorSet = "none"
        secondNumber = 0.0
        doRefresh()
        equalSet = true
        
        return getAnswer()
    }
    
    @discardableResult func addPressed() -> String {
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate()
            doRefresh()
            
        }
        operatorSet = "+"
        tempOp = "+"
        decimalSet = false
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        doRefresh()
        if firstNumber >= 9999999999.0{
            answer = "\(firstNumber)"
        }else{
            answer = "\(Int(firstNumber))"
        }
        
        return getAnswer()
    }
    
    @discardableResult func zeroPressed() -> String {
        newNumber = 0.0
        numberSelectedBool = true
        if (decimalSet == false){
            numberLenghtOne += 1.0
            numberLenghtTwo += 1.0
        }else{
            numberLenghtTwo += 1.0
        }
        
        allClear = 0
        doMath()
        doRefresh()
        
        if (equalSet == true && operatorSet == "none"){
            firstNumber = 0.0
            equalSet = false
        }
        
        if (decimalSet == true){
            if (operatorSet != "none"){
                answer = "\(secondNumber)"
            }else{
                answer = "\(firstNumber)"
            }
        }
        
        return getAnswer()
    }
    
    @discardableResult func digitPressed(digit : Double) -> String {
        if (decimalSet == false){
            newNumber = digit
            numberLenghtOne += 1.0
            numberLenghtTwo += 1.0
        }else{
            newNumber = digit / 10
            numberLenghtTwo += 1.0
        }
        
        if (equalSet == true && operatorSet == "none"){
            firstNumber = 0.0
            equalSet = false
        }
        
        allClear = 0
        numberSelectedBool = true
        doMath()
        doRefresh()
        
        return getAnswer()
    }
    
    private func doMath() {
        decimalPlace = numberLenghtTwo - numberLenghtOne - 1
        if (numberSelectedBool == true){
            if (decimalSet == false){
                if (operatorSet == "none"){
                    firstNumber = firstNumber * 10
                    
                    if (firstNumber >= 0){
                        firstNumber = firstNumber + newNumber
                    }
                    
                    if (firstNumber < 0){
                        firstNumber = firstNumber - newNumber
                    }
                    
                    numberSelectedBool = false
                    newNumber = 0.0
                }else{
                    secondNumber = secondNumber * 10
                    
                    if (secondNumber >= 0){
                        secondNumber = secondNumber + newNumber
                    }
                    
                    if (secondNumber < 0){
                        secondNumber = secondNumber - newNumber
                    }
                    
                    numberSelectedBool = false
                    newNumber = 0.0
                }
            }else{
                if (decimalPlace == 0){
                    if (operatorSet == "none"){
                        if (firstNumber >= 0){
                            firstNumber = firstNumber + newNumber
                        }
                        
                        if (firstNumber < 0){
                            firstNumber = firstNumber - newNumber
                        }
                        
                        numberSelectedBool = false
                        newNumber = 0.0
                    }else{
                        
                        if (secondNumber >= 0){
                            secondNumber = secondNumber + newNumber
                        }
                        
                        if (secondNumber < 0){
                            secondNumber = secondNumber - newNumber
                        }
                    }
                }else{
                    if (operatorSet == "none"){
                        if (firstNumber >= 0){
                            firstNumber = firstNumber * pow(10.0, decimalPlace)
                            firstNumber = firstNumber + newNumber
                            firstNumber = firstNumber / pow(10.0, decimalPlace)
                        }
                        
                        if (firstNumber < 0){
                            firstNumber = firstNumber * pow(10.0, decimalPlace)
                            firstNumber = firstNumber - newNumber
                            firstNumber = firstNumber / pow(10.0, decimalPlace)
                        }
                        
                        numberSelectedBool = false
                        newNumber = 0.0
                    }else{
                        
                        if (secondNumber >= 0){
                            secondNumber = secondNumber * pow(10.0, decimalPlace)
                            secondNumber = secondNumber + newNumber
                            secondNumber = secondNumber / pow(10.0, decimalPlace)
                        }
                        
                        if (secondNumber < 0){
                            secondNumber = secondNumber * pow(10.0, decimalPlace)
                            secondNumber = secondNumber - newNumber
                            secondNumber = secondNumber / pow(10.0, decimalPlace)
                        }
                    }
                }
            }
            if (operatorSet != "none" && secondNumber != 0.0){
                tempNum = secondNumber
            }
            
            numberSelectedBool = false
            newNumber = 0.0
        }
    }
    
    private func doRefresh() {
        var firstNumberNoDec = 0
        var secondNumberNoDec = 0
        
        
        if (operatorSet == "none"){
            let floatNumberBefore = Float(firstNumber)
            let floatNumberAfter = Float(firstNumberNoDec)
            
            if firstNumber >= 9999999999.0{
                
                firstNumberNoDec = 0
                
                answer = "\(firstNumber)"
            }else{
                
                firstNumberNoDec = Int(firstNumber)
                
                if (floatNumberBefore == floatNumberAfter){
                    answer = "\(firstNumber)"
                }else{
                    answer = "\(firstNumberNoDec)"
                }
                
            }
        }else{
            let floatNumberBefore = Float(secondNumber)
            let floatNumberAfter = Float(secondNumberNoDec)
            
            if secondNumber >= 9999999999.0{
                
                secondNumberNoDec = 0
                
                if (secondNumber == 0){
                    answer = "\(firstNumber)"
                }else{
                    answer = "\(secondNumber)"
                }
            }else{
                
                secondNumberNoDec = Int(secondNumber)
                
                if (floatNumberBefore == floatNumberAfter){
                    if (secondNumber == 0){
                        answer = "\(firstNumber)"
                    }else{
                        answer = "\(secondNumber)"
                    }
                }else{
                    if (secondNumber == 0){
                        answer = "\(firstNumberNoDec)"
                    }else{
                        answer = "\(secondNumberNoDec)"
                    }
                }
            }
        }
        
        if (allClear == 1){
            answer = "\(Int(secondNumber))"
        }
        
        if (allClear == 2){
            answer = "\(Int(firstNumber))"
            allClear = 0
        }
        
        if (firstNumber == 0){
            answer = "\(firstNumberNoDec)"
        }
    }
    
    private func doCalculate() {
        if (operatorSet == "none"){
            if (tempOp == "/"){
                firstNumber = firstNumber / tempNum
            }
            
            if (tempOp == "*"){
                firstNumber = firstNumber * tempNum
            }
            
            if (tempOp == "-"){
                firstNumber = firstNumber - tempNum
            }
            
            if (tempOp == "+"){
                firstNumber = firstNumber + tempNum
            }
        }else{
            if (operatorSet == "/"){
                if (secondNumber == 0.0){
                    firstNumber = firstNumber / firstNumber
                }else{
                    firstNumber = firstNumber / secondNumber
                }
            }
            
            if (operatorSet == "*"){
                if (secondNumber == 0.0){
                    firstNumber = firstNumber * firstNumber
                }else{
                    firstNumber = firstNumber * secondNumber
                }
            }
            
            if (operatorSet == "-"){
                if (secondNumber == 0.0){
                    firstNumber = firstNumber - firstNumber
                }else{
                    firstNumber = firstNumber - secondNumber
                }
            }
            
            if (operatorSet == "+"){
                if (secondNumber == 0.0){
                    firstNumber = firstNumber + firstNumber
                }else{
                    firstNumber = firstNumber + secondNumber
                }
            }
        }
        
        doRefresh()
    }
}
