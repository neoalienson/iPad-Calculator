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

}
