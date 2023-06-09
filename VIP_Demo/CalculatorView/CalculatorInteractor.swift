//
//  CalculatorInteractor.swift
//  MVVM_VS_VIP
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CalculatorBusinessLogic
{
    func clickNumber(btnNumber: Int)
    func clickOperations(operationSelect: CalculatorModel.TypeOperations)
    func inputNumber(number1 : Int, number2 : Int, typeCalculate: CalculatorModel.TypeOperations)
    func calNumberForPlus(request: CalculatorModel.Plus.Request)
    func calNumberForMinus(request: CalculatorModel.Minus.Request)
    func calNumberForMultiply(request: CalculatorModel.Multiply.Request)
    func calNumberForDivide(request: CalculatorModel.Divide.Request)
    func resultNumberEqual()
    func clearNumber()
}

protocol CalculatorDataStore
{
    var number1: String { get set }
    var number2: String { get set }
    var precalNumber: Int { get set }
    var operation: CalculatorModel.TypeOperations? { get set }
}

class CalculatorInteractor: CalculatorBusinessLogic, CalculatorDataStore
{
    
    var presenter: CalculatorPresentationLogic?
    var worker: CalculatorWorker?
    var number1: String = ""
    var number2: String = ""
    var precalNumber: Int = 0
    var operation: CalculatorModel.TypeOperations? = nil
    
    
    // MARK: CalculatorBusinessLogic
    func clickNumber(btnNumber: Int) {
        
        let textNumber = "\(btnNumber)"
        if operation == nil {
            if number1.isEmpty {
                number1 = textNumber
            } else {
                number1 += textNumber
            }
            self.presenter?.presentClickNumber(textCalculator: textNumber)
        } else {
            if number2.isEmpty {
                number2 = textNumber
            } else {
                number2 += textNumber
            }
            self.presenter?.presentClickNumber(textCalculator: textNumber)
            let n1 : Int = Int(self.number1) ?? 0
            let n2 : Int = Int(self.number2) ?? 0
            self.inputNumber(number1: n1 , number2: n2, typeCalculate: operation ?? .null)
        }
        
        
    }
    
    func clickOperations(operationSelect: CalculatorModel.TypeOperations) {
        //check this first for move number2 replace number1 for display PreCal
        if self.operation != nil {
            number1 = "\(self.precalNumber)"
            number2 = ""
        }
        self.operation = operationSelect
        let textOperation = " \(operationSelect.rawValue) "
        self.presenter?.presentClickNumber(textCalculator: textOperation)
        
    }
    
    func inputNumber(number1: Int, number2: Int, typeCalculate typeOperationCal: CalculatorModel.TypeOperations) {
        switch typeOperationCal {
        case .plus:
            let requestPlus = CalculatorModel.Plus.Request(number1: number1, number2: number2)
            self.calNumberForPlus(request: requestPlus)
        case .minus:
            let requestMinus = CalculatorModel.Minus.Request(number1: number1, number2: number2)
            self.calNumberForMinus(request: requestMinus)
        case .multiply:
            let requestMultiply = CalculatorModel.Multiply.Request(number1: number1, number2: number2)
            self.calNumberForMultiply(request: requestMultiply)
        case .divide:
            let requestDivide = CalculatorModel.Divide.Request(number1: number1, number2: number2)
            self.calNumberForDivide(request: requestDivide)
        case .null:
            break
        }
    }
    
    func calNumberForPlus(request: CalculatorModel.Plus.Request) {
        self.precalNumber = request.precalNumber
        let response = CalculatorModel.Plus.Response(preCalResultNumber: self.precalNumber)
        self.presenter?.presentCalNumberForPlus(response: response)
    }
    
    func calNumberForMinus(request: CalculatorModel.Minus.Request) {
        self.precalNumber = request.precalNumber
        let response = CalculatorModel.Plus.Response(preCalResultNumber: self.precalNumber)
        self.presenter?.presentCalNumberForPlus(response: response)
    }
    
    func calNumberForMultiply(request: CalculatorModel.Multiply.Request) {
        self.precalNumber = request.precalNumber
        let response = CalculatorModel.Plus.Response(preCalResultNumber: self.precalNumber)
        self.presenter?.presentCalNumberForPlus(response: response)
    }
    
    func calNumberForDivide(request: CalculatorModel.Divide.Request) {
        self.precalNumber = request.precalNumber
        let response = CalculatorModel.Plus.Response(preCalResultNumber: self.precalNumber)
        self.presenter?.presentCalNumberForPlus(response: response)
    }
    
    func resultNumberEqual() {
        let response = CalculatorModel.Equal.Response(preCalResultNumber: self.precalNumber)
        self.presenter?.presentResultNumberEqual(response: response)
    }
    
    func clearNumber() {
        number1 = ""
        number2 = ""
        precalNumber = 0
        operation = nil
        self.presenter?.presentClearNumber()
    }
}
