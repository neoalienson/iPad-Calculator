//
//  ViewController.swift
//  Calculator
//
//  Created by Jack Vaughn and Dustin Nazelrod.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelAnswer: UILabel!
    
    var firstNumber = 0.0;
    var secondNumber = 0.0;
    var secondNumberNoDec = 0;
    var newNumber = 0.0;
    var operatorSet = "none"
    var decimalSet = false;
    var numberSelectedBool = false;
    var numberLenghtOne = 0.0;
    var numberLenghtTwo = 0.0;
    var decimalPlace = 0.0;
    var tempOp = "none";
    var tempNum = 0.0;
    var allClear = 0;
    var zeroCounter = 0 //not putting gay semicolin ;)

    
    func doMath() {
        decimalPlace = numberLenghtTwo - numberLenghtOne - 1;
        if (numberSelectedBool == true){
            if (decimalSet == false){
                if (operatorSet == "none"){
                    firstNumber = firstNumber * 10;
            
                    if (firstNumber >= 0){
                        firstNumber = firstNumber + newNumber;
                    }
            
                    if (firstNumber < 0){
                        firstNumber = firstNumber - newNumber;
                    }
            
                    numberSelectedBool = false;
                    newNumber = 0.0;
                }else{
                    secondNumber = secondNumber * 10;
                
                    if (secondNumber >= 0){
                        secondNumber = secondNumber + newNumber;
                    }
            
                    if (secondNumber < 0){
                        secondNumber = secondNumber - newNumber;
                    }
            
                    numberSelectedBool = false;
                    newNumber = 0.0;
                }
            }else{
                if (decimalPlace == 0){
                    if (operatorSet == "none"){
                        if (firstNumber >= 0){
                            firstNumber = firstNumber + newNumber;
                        }
                
                        if (firstNumber < 0){
                            firstNumber = firstNumber - newNumber;
                        }
                
                        numberSelectedBool = false;
                        newNumber = 0.0;
                    }else{
                
                        if (secondNumber >= 0){
                            secondNumber = secondNumber + newNumber;
                        }
                
                        if (secondNumber < 0){
                                secondNumber = secondNumber - newNumber;
                            }
                        }
                }else{
                    if (operatorSet == "none"){
                        if (firstNumber >= 0){
                            firstNumber = firstNumber * pow(10.0, decimalPlace);
                            firstNumber = firstNumber + newNumber;
                            firstNumber = firstNumber / pow(10.0, decimalPlace);
                        }
                    
                        if (firstNumber < 0){
                            firstNumber = firstNumber * pow(10.0, decimalPlace);
                            firstNumber = firstNumber - newNumber;
                            firstNumber = firstNumber / pow(10.0, decimalPlace);
                        }
                    
                        numberSelectedBool = false;
                        newNumber = 0.0;
                    }else{
                    
                        if (secondNumber >= 0){
                            secondNumber = secondNumber * pow(10.0, decimalPlace);
                            secondNumber = secondNumber + newNumber;
                            secondNumber = secondNumber / pow(10.0, decimalPlace);
                        }
                    
                        if (secondNumber < 0){
                            secondNumber = secondNumber * pow(10.0, decimalPlace);
                            secondNumber = secondNumber - newNumber;
                            secondNumber = secondNumber / pow(10.0, decimalPlace);
                        }
                    }
                }
            }
            if (operatorSet != "none" && secondNumber != 0.0){
            tempNum = secondNumber;
            }
            
            numberSelectedBool = false;
            newNumber = 0.0;
        }
    }
    
    func doRefresh() {
        var firstNumberNoDec = Int(firstNumber);
        var secondNumberNoDec = Int(secondNumber);
        
        
        if (operatorSet == "none"){
            var floatNumberBefore = Float(firstNumber);
            var floatNumberAfter = Float(firstNumberNoDec);
            
            if (floatNumberBefore == floatNumberAfter){
                labelAnswer.text = "\(firstNumberNoDec)";
            }else{
                labelAnswer.text = "\(firstNumber)";
            }
        }else{
            var floatNumberBefore = Float(secondNumber);
            var floatNumberAfter = Float(secondNumberNoDec);
            
            if (floatNumberBefore == floatNumberAfter){
                if (secondNumber == 0){
                    labelAnswer.text = "\(secondNumberNoDec)";
                }else{
                    labelAnswer.text = "\(secondNumberNoDec)";
                }
            }else{
                if (secondNumber == 0){
                    labelAnswer.text = "\(secondNumber)";
                }else{
                    labelAnswer.text = "\(secondNumber)";
                }
            }
        }
    }
    
    func doCalculate() {
        
        if (operatorSet == "none"){
            
            if (tempOp == "/"){
                firstNumber = firstNumber / tempNum;
            }
            
            if (tempOp == "*"){
                firstNumber = firstNumber * tempNum;
            }
            
            if (tempOp == "-"){
                firstNumber = firstNumber - tempNum;
            }
            
            if (tempOp == "+"){
                firstNumber = firstNumber + tempNum;
            }
        }else{
        
            if (operatorSet == "/"){
                
                if (secondNumber == 0.0){
                    firstNumber = firstNumber / firstNumber;
                }else{
                    firstNumber = firstNumber / secondNumber;
                }
            }
    
            if (operatorSet == "*"){
                
                if (secondNumber == 0.0){
                    firstNumber = firstNumber * firstNumber;
                }else{
                    firstNumber = firstNumber * secondNumber;
                }
            }
    
            if (operatorSet == "-"){
                
                if (secondNumber == 0.0){
                    firstNumber = firstNumber - firstNumber;
                }else{
                    firstNumber = firstNumber - secondNumber;
                }
            }
    
            if (operatorSet == "+"){
                
                if (secondNumber == 0.0){
                    firstNumber = firstNumber + firstNumber;
                }else{
                    firstNumber = firstNumber + secondNumber;
                }
            }
        }
        
        doRefresh();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        doRefresh();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

//Start of button control
    
    @IBAction func buttonDecimalPressed() {
        if (decimalSet == false){
            decimalSet = true;
            doRefresh();
        }
    }
    
    @IBAction func buttonNegativePressed() {
        newNumber = -1.0;
        numberSelectedBool = true;
        
        if (operatorSet == "none"){
            firstNumber = firstNumber * newNumber;
            numberSelectedBool = false;
        }else{
            secondNumber = secondNumber * newNumber;
            numberSelectedBool = false;
        }
        
        doRefresh();
    }
    
    @IBAction func buttonClearPressed() {
        if (operatorSet == "none"){
            firstNumber = 0.0;
        }else{
            secondNumber = 0.0;
            allClear += 1;
        }
        
        if (allClear == 2){
            operatorSet = "none";
            firstNumber = 0.0;
            allClear = 0;
            
        }
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        decimalSet = false;
        doRefresh();
    }
    
    @IBAction func buttonDevidePressed() {
        
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate();
            doRefresh();
        }
        
        operatorSet = "/";
        tempOp = "/";
        decimalSet = false;
        numberLenghtTwo = 0.0
        numberLenghtOne = 0.0
        doRefresh();
    }
    
    @IBAction func buttonMultiplyPressed() {
        
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate();
            doRefresh();
        }
        
        operatorSet = "*";
        tempOp = "*";
        decimalSet = false;
        numberLenghtTwo = 0.0;
        numberLenghtOne = 0.0;
        doRefresh();
    }
    
    @IBAction func buttonSubtractPressed() {
        
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate();
            doRefresh();
        }
        
        operatorSet = "-";
        tempOp = "-";
        decimalSet = false;
        numberLenghtTwo = 0.0;
        numberLenghtOne = 0.0;
        doRefresh();
    }
    
    @IBAction func buttonAddPressed() {
        
        if (operatorSet != "none" && secondNumber != 0.0){
            doCalculate();
            doRefresh();
        
        }
        operatorSet = "+";
        tempOp = "+";
        decimalSet = false;
        numberLenghtTwo = 0.0;
        numberLenghtOne = 0.0;
        doRefresh();
    }
    
    @IBAction func buttonEqualsPressed() {
        doCalculate();
        operatorSet = "none";
        secondNumber = 0.0;
        doRefresh();
        }
    
    @IBAction func button0Pressed() {
        newNumber = 0.0;
        numberSelectedBool = true;
        if (decimalSet == false){
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        doMath();
        doRefresh();
        if (decimalSet == true){
            if (operatorSet != "none"){
                labelAnswer.text = "\(secondNumber)";
            }else{
                labelAnswer.text = "\(firstNumber)";
            }
        }
    }
    
    func numberButtonPressed(numberOne: Double, numberTwo: Double) { //all numbers have the same function with different numbers, using one function with two arguments will cut down on
        if (decimalSet == false){
            newNumber = numberOne;
            numberLenghtOne += numberOne;
            numberLenghtTwo += numberOne;
        }else{
            newNumber = numberTwo;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
        zeroCounter = 0
    }
    
    @IBAction func button1Pressed() {
        numberButtonPressed(1.0, numberTwo: 0.1)
    }
    
    @IBAction func button2Pressed() {
        numberButtonPressed(2.0, numberTwo: 0.2)
    }
    
    @IBAction func button3Pressed() {
        numberButtonPressed(3.0, numberTwo: 0.3)
    }
    
    @IBAction func button4Pressed() {
        numberButtonPressed(4.0, numberTwo: 0.4)
    }
    
    @IBAction func button5Pressed() {
        numberButtonPressed(5.0, numberTwo: 0.5)
    }
    
    @IBAction func button6Pressed() {
        numberButtonPressed(6.0, numberTwo: 0.6)
    }
    
    @IBAction func button7Pressed() {
        numberButtonPressed(7.0, numberTwo: 0.7)
    }
    
    @IBAction func button8Pressed() {
        numberButtonPressed(8.0, numberTwo: 0.8)
    }
    
    @IBAction func button9Pressed() {
        numberButtonPressed(9.0, numberTwo: 0.9)
    }
}