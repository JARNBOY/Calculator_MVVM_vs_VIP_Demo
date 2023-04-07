//
//  VIP_DemoTests.swift
//  VIP_DemoTests
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//

import XCTest
@testable import VIP_Demo

final class when_calculating_after_click_number: XCTestCase {

    func test_should_calculate_plus_number_successfully() {
        let numberPlus = CalculatorModel.Plus.Request(number1: 5, number2: 5)
        XCTAssertEqual(10, numberPlus.precalNumber)
    }
    
    func test_should_calculate_minus_number_successfully() {
        let numberMinus = CalculatorModel.Minus.Request(number1: 5, number2: 5)
        XCTAssertEqual(0, numberMinus.precalNumber)
    }
    
    func test_should_calculate_multiply_number_successfully() {
        let numberMultiply = CalculatorModel.Multiply.Request(number1: 5, number2: 5)
        XCTAssertEqual(25, numberMultiply.precalNumber)
    }
    
    func test_should_calculate_divide_number_successfully() {
        let numberDivide = CalculatorModel.Divide.Request(number1: 5, number2: 5)
        XCTAssertEqual(1, numberDivide.precalNumber)
    }
    

}
