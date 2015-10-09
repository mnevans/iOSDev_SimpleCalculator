//
//  main.swift
//  calculator
//
//  Created by iGuest on 10/8/15.
//  Copyright © 2015 iGuest. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

func calculate(operation: String, firstNumber: Int, secondNumber: Int) -> Int {
    switch operation {
    case "+":
        return firstNumber + secondNumber
    case "-":
        return firstNumber - secondNumber
    case "*":
        return firstNumber * secondNumber
    case "/":
        return firstNumber / secondNumber
    case "%":
        return firstNumber % secondNumber
    default:
        print("Math is fun if you enter a correct value!")
        return 0
    }
}

func multipleOperand(operation:[String]) -> Int {
    switch operation[operation.count - 1] {
    case "count":
        return operation.count - 1
    case "avg":
        var sum = 0
        for var i = 0; i < operation.count - 1; i++ {
            sum = sum + convert(operation[i])
        }
        return sum / (operation.count - 1)
    case "fact":
        if operation.count > 2 {
            print("Please enter only one number to be calculated.")
            return 0
        } else {
            var fact = convert(operation[0]);
            for var i = convert(operation[0]); i > 1; i-- {
                fact *= i - 1
            }
            return fact
        }
    default:
        print("Please enter correct values and try again.")
        return 0
    }
}

print("Please enter an expression separated by returns:")
var first = input()
let nums = first.componentsSeparatedByString(" ")
    
if (nums.count == 1) {
    let operand = input()
    var second = input()
    let firstNumber = convert(first)
    let secondNumber = convert(second)
    let result = calculate(operand, firstNumber: firstNumber, secondNumber: secondNumber)
    print(result)
} else {
    let otherResult = multipleOperand(nums)
    print(otherResult)
}