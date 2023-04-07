//
//  CalculatorModel.swift
//  MVVM_Demo
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//

import Foundation

class CalculatorModel {
    
    func plusNumber(number1: Int , number2: Int) -> Int {
        return number1 + number2
    }
    
    func minusNumber(number1: Int , number2: Int) -> Int {
        return number1 - number2
    }
    
    func multiplyNumber(number1: Int , number2: Int) -> Int  {
        return number1 * number2
    }
    
    func divideNumber(number1: Int , number2: Int) -> Int  {
        return number1 / number2
    }
    
}

enum TypeOperations:String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case null = ""
}
