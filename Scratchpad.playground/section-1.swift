// Playground - noun: a place where people can play

import UIKit

var firstNumber = 5.0;
var integerNumber = Int(firstNumber);
var floatNumberBefore = Float(firstNumber);
var floatNumberAfter = Float(integerNumber);

if (floatNumberBefore == floatNumberAfter){
    println("\(integerNumber)");
}else{
    println("\(firstNumber)");
}
