// Playground - noun: a place where people can play

import UIKit

var number: Float = 5498888

var numberString = "\(number)"

var numberStringLength = Float(countElements(numberString))

if numberStringLength >= 10.0 {
    
    var numberToPrint = number * pow(10, -(numberStringLength-1))
    
} else {
    var numberToPrint = number
}