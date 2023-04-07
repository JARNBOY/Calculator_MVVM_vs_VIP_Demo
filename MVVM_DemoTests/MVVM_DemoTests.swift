//
//  MVVM_DemoTests.swift
//  MVVM_DemoTests
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//

import XCTest
@testable import MVVM_Demo

final class when_calculating_after_click_number: XCTestCase {
    
    let vm = CalculatorViewModel(CalculatorModel())

    func test_should_calculate_plus_number_successfully() {
        
        let resultNumberPlus = vm.calculator.plusNumber(number1: 5, number2: 5)
        XCTAssertEqual(10, resultNumberPlus)
    }
    
    func test_should_calculate_minus_number_successfully() {
        let resultNumberMinus = vm.calculator.minusNumber(number1: 5, number2: 5)
        XCTAssertEqual(0, resultNumberMinus)
    }
    
    func test_should_calculate_multiply_number_successfully() {
        let resultNumberMultiply = vm.calculator.multiplyNumber(number1: 5, number2: 5)
        XCTAssertEqual(25, resultNumberMultiply)
    }
    
    func test_should_calculate_divide_number_successfully() {
        let resultNumberDivide = vm.calculator.divideNumber(number1: 5, number2: 5)
        XCTAssertEqual(1, resultNumberDivide)
    }
    

}
