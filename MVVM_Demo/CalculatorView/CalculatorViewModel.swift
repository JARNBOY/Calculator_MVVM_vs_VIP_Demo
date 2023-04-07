//
//  CalculatorViewModel.swift
//  MVVM_Demo
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//

import Foundation

protocol CalculatorBusinessLogic
{
    mutating func clickNumber(btnNumber: Int)
    mutating func clickOperations(operationSelect: TypeOperations)
    mutating func inputNumber(number1 : Int, number2 : Int, typeCalculate: TypeOperations)
    mutating func resultNumberEqual()
    mutating func clearNumber()
}

struct CalculatorViewModel {
    var calculator : CalculatorModel
    var number1: String = ""
    var number2: String = ""
    var precalNumber: Int = 0
    var operation: TypeOperations? = nil
    var textCalculatorDisplay = ""
    var textPreCalResultDisplay = ""
    
}

extension CalculatorViewModel {
    
    init(_ calculatorModel: CalculatorModel) {
        self.calculator = calculatorModel
    }
    
    private mutating func setTextCalculatorDisplay(text: String) {
        textCalculatorDisplay += text
    }
    
    private mutating func setCalNumberResult(result: Int) {
        self.precalNumber = result
        self.textPreCalResultDisplay = "\(self.precalNumber)"
    }
    
}

extension CalculatorViewModel : CalculatorBusinessLogic {
    
    mutating func clickNumber(btnNumber: Int) {
        
        let textNumber = "\(btnNumber)"
        if operation == nil {
            if number1.isEmpty {
                number1 = textNumber
            } else {
                number1 += textNumber
            }
            
            setTextCalculatorDisplay(text: textNumber)
        } else {
            if number2.isEmpty {
                number2 = textNumber
            } else {
                number2 += textNumber
            }
            
            setTextCalculatorDisplay(text: textNumber)
            
            let n1 : Int = Int(self.number1) ?? 0
            let n2 : Int = Int(self.number2) ?? 0
            self.inputNumber(number1: n1 , number2: n2, typeCalculate: operation ?? .null)
        }
        
    }
    
    mutating func clickOperations(operationSelect: TypeOperations) {
        //check this first for move number2 replace number1 for display PreCal
        if self.operation != nil {
            number1 = "\(self.precalNumber)"
            number2 = ""
        }
        self.operation = operationSelect
        let textOperation = " \(operationSelect.rawValue) "
        setTextCalculatorDisplay(text: textOperation)
        
    }
    
    mutating func inputNumber(number1 : Int, number2 : Int, typeCalculate: TypeOperations) {
        switch typeCalculate {
        case .plus:
            let resultPlus = calculator.plusNumber(number1: number1, number2: number2)
            self.setCalNumberResult(result: resultPlus)
        case .minus:
            let resultMinus = calculator.minusNumber(number1: number1, number2: number2)
            self.setCalNumberResult(result: resultMinus)
        case .multiply:
            let resultMultiply = calculator.multiplyNumber(number1: number1, number2: number2)
            self.setCalNumberResult(result: resultMultiply)
        case .divide:
            let resultDivide = calculator.divideNumber(number1: number1, number2: number2)
            self.setCalNumberResult(result: resultDivide)
        case .null:
            break
        }
    }
    
    mutating func resultNumberEqual() {
        self.textCalculatorDisplay = "\(self.precalNumber)"
        self.textPreCalResultDisplay = ""
    }
    
    mutating func clearNumber() {
        number1 = ""
        number2 = ""
        precalNumber = 0
        operation = nil
        self.textCalculatorDisplay = ""
        self.textPreCalResultDisplay = ""
    }
}

