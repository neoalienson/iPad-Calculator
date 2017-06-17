//
//  InterfaceController.swift
//  CalculatorWatch Extension
//
//  Created by Neo on 6/16/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var labelAnswer: WKInterfaceLabel!
    @IBOutlet var buttonClear: WKInterfaceButton!
    @IBOutlet var buttonDivide: WKInterfaceButton!
    @IBOutlet var buttonMultiply: WKInterfaceButton!
    @IBOutlet var buttonSubtract: WKInterfaceButton!
    @IBOutlet var buttonAdd: WKInterfaceButton!
    @IBOutlet var buttonEqual: WKInterfaceButton!
    @IBOutlet var buttonDecimal: WKInterfaceButton!
    @IBOutlet var button1: WKInterfaceButton!
    @IBOutlet var button2: WKInterfaceButton!
    @IBOutlet var button3: WKInterfaceButton!
    @IBOutlet var button4: WKInterfaceButton!
    @IBOutlet var button0: WKInterfaceButton!
    @IBOutlet var button5: WKInterfaceButton!
    @IBOutlet var button6: WKInterfaceButton!
    @IBOutlet var button7: WKInterfaceButton!
    @IBOutlet var button8: WKInterfaceButton!
    @IBOutlet var button9: WKInterfaceButton!
    
    var calculator : Calculator = Calculator()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func buttonDividePressed() {
        labelAnswer.setText(calculator.dividePressed())
    }
    
    @IBAction func buttonAddPressed() {
        labelAnswer.setText(calculator.addPressed())
    }
    
    @IBAction func buttonMultiplyPressed() {
        labelAnswer.setText(calculator.multiplyPressed())
    }
    
    @IBAction func buttonSubtractPressed() {
        labelAnswer.setText(calculator.subtractPressed())
    }
    
    @IBAction func buttonEqualPressed() {
        labelAnswer.setText(calculator.equalPressed())
    }
    
    @IBAction func buttonDecimalPressed() {
        labelAnswer.setText(calculator.decimalPressed())
    }
    
    @IBAction func button0Pressed() {
        labelAnswer.setText(calculator.zeroPressed())
    }
    
    @IBAction func button1Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 1.0))
    }
    
    @IBAction func button2Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 2.0))
    }
    
    @IBAction func button3Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 3.0))
    }
    
    @IBAction func button4Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 4.0))
    }
    
    @IBAction func button5Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 5.0))
    }
    
    @IBAction func button6Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 6.0))
    }
    
    @IBAction func button7Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 7.0))
    }
    
    @IBAction func button8Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 8.0))
    }
    
    @IBAction func button9Pressed() {
        labelAnswer.setText(calculator.digitPressed(digit: 9.0))
    }
    
    @IBAction func buttonClearPressed() {
        labelAnswer.setText(calculator.clearPressed())
    }
}
