//
//  ViewController.swift
//  Calculator
//
//  Created by Jack Vaughn and Dustin Nazelrod.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelAnswer: UILabel! //declare UI objects
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonNegative: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
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
    
    @IBAction func button1Pressed() {
        if (decimalSet == false){
            newNumber = 1.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.1;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button2Pressed() {
        if (decimalSet == false){
            newNumber = 2.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.2;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button3Pressed() {
        if (decimalSet == false){
            newNumber = 3.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.3;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button4Pressed() {
        if (decimalSet == false){
            newNumber = 4.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.4;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button5Pressed() {
        if (decimalSet == false){
            newNumber = 5.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.5;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button6Pressed() {
        if (decimalSet == false){
            newNumber = 6.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.6;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button7Pressed() {
        if (decimalSet == false){
            newNumber = 7.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.7;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button8Pressed() {
        if (decimalSet == false){
            newNumber = 8.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.8;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
    
    @IBAction func button9Pressed() {
        if (decimalSet == false){
            newNumber = 9.0;
            numberLenghtOne += 1.0;
            numberLenghtTwo += 1.0;
        }else{
            newNumber = 0.9;
            numberLenghtTwo += 1.0;
        }
        
        allClear = 0;
        numberSelectedBool = true;
        doMath();
        doRefresh();
    }
}