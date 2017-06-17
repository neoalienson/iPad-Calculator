//
//  ViewController.swift
//  Calculator
//
//  Created by Jack Vaughn and Dustin Nazelrod.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var labelAnswer: UILabel! //declare UI objects
    @IBOutlet var buttonClear: UIButton!
    @IBOutlet var buttonNegative: UIButton!
    @IBOutlet var buttonDivide: UIButton!
    @IBOutlet var buttonMultiply: UIButton!
    @IBOutlet var buttonSubtract: UIButton!
    @IBOutlet var buttonAdd: UIButton!
    @IBOutlet var buttonEqual: UIButton!
    @IBOutlet var buttonDecimal: UIButton!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    var cal: Calculator = Calculator()
    
    //Start of button control
    
    @IBAction func buttonDecimalPressed() {
        labelAnswer.text = cal.decimalPressed()
    }
    
    @IBAction func buttonNegativePressed() {
        labelAnswer.text = cal.negativePressed()
    }
    
    @IBAction func buttonClearPressed() {
        labelAnswer.text = cal.clearPressed()
    }
    
    @IBAction func buttonDevidePressed() {
        labelAnswer.text = cal.dividePressed()
    }
    
    @IBAction func buttonMultiplyPressed() {
        labelAnswer.text = cal.multiplyPressed()
    }
    
    @IBAction func buttonSubtractPressed() {
        labelAnswer.text = cal.subtractPressed()
    }
    
    @IBAction func buttonAddPressed() {
        labelAnswer.text = cal.addPressed()
    }
    
    @IBAction func buttonEqualsPressed() {
        labelAnswer.text = cal.equalPressed()
    }
    
    @IBAction func button0Pressed() {
        labelAnswer.text = cal.zeroPressed()
    }
    
    @IBAction func button1Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 1.0)
    }
    
    @IBAction func button2Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 2.0)
    }
    
    @IBAction func button3Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 3.0)
    }
    
    @IBAction func button4Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 4.0)
    }
    
    @IBAction func button5Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 5.0)
    }
    
    @IBAction func button6Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 6.0)
    }
    
    @IBAction func button7Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 7.0)
    }
    
    @IBAction func button8Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 8.0)
    }
    
    @IBAction func button9Pressed() {
        labelAnswer.text = cal.digitPressed(digit: 9.0)
    }
}
