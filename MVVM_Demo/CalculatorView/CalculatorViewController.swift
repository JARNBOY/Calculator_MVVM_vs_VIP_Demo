//
//  CalculatorViewController.swift
//  MVVM_Demo
//
//  Created by Papon Supamongkonchai on 7/4/2566 BE.
//

import UIKit

protocol CalculatorDisplayLogic: AnyObject
{
    func displayClickNumber(textCalculatorDisplay: String)
    func displayClickOperations(textOperationDisplay: String)
    func displayCalNumber(resultPreCalNumber : String)
    func displayResultNumberEqual(result: String)
    func displayClearNumber()
}

class CalculatorViewController: UIViewController {
    
    // MARK: Property View
    @IBOutlet weak var lblTextInputCalculate: UILabel!
    @IBOutlet weak var lblTextDisplayPreCalResult: UILabel!
    
    // MARK: Property Control
    private var vm : CalculatorViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vm = CalculatorViewModel(CalculatorModel())
        displayClearNumber()
    }
    
    private func displayNumber(number: Int) {
        vm?.clickNumber(btnNumber: number)
        displayClickNumber(textCalculatorDisplay: vm?.textCalculatorDisplay ?? "")
        displayCalNumber(resultPreCalNumber: vm?.textPreCalResultDisplay ?? "" )
    }
    
    // MARK: Button Action
    @IBAction func btn_number_0_click() {
        displayNumber(number: 0)
    }
    
    @IBAction func btn_number_1_click() {
        displayNumber(number: 1)
    }
    
    @IBAction func btn_number_2_click() {
        displayNumber(number: 2)
    }
    
    @IBAction func btn_number_3_click() {
        displayNumber(number: 3)
    }
    
    @IBAction func btn_number_4_click() {
        displayNumber(number: 4)
    }
    
    @IBAction func btn_number_5_click() {
        displayNumber(number: 5)
    }
    
    @IBAction func btn_number_6_click() {
        displayNumber(number: 6)
    }
    
    @IBAction func btn_number_7_click() {
        displayNumber(number: 7)
    }
    
    @IBAction func btn_number_8_click() {
        displayNumber(number: 8)
    }
    
    @IBAction func btn_number_9_click() {
        displayNumber(number: 9)
    }
    
    @IBAction func btn_plus_click() {
        vm?.clickOperations(operationSelect: .plus)
        displayClickOperations(textOperationDisplay: "+")
    }
    
    @IBAction func btn_minus_click() {
        vm?.clickOperations(operationSelect: .minus)
        displayClickOperations(textOperationDisplay: "-")
    }
    
    @IBAction func btn_multiply_click() {
        vm?.clickOperations(operationSelect: .multiply)
        displayClickOperations(textOperationDisplay: "*")
    }
    
    @IBAction func btn_divide_click() {
        vm?.clickOperations(operationSelect: .divide)
        displayClickOperations(textOperationDisplay: "/")
    }
    
    @IBAction func btn_equal_click() {
        vm?.resultNumberEqual()
        displayResultNumberEqual(result: vm?.textCalculatorDisplay ?? "")
    }
    
    @IBAction func btn_clear_click() {
        vm?.clearNumber()
        displayClearNumber()
    }

}

extension CalculatorViewController : CalculatorDisplayLogic {
    func displayClickNumber(textCalculatorDisplay: String) {
        self.lblTextInputCalculate.text = textCalculatorDisplay
    }
    
    func displayClickOperations(textOperationDisplay: String) {
        var textCurrentInputCalculate = self.lblTextInputCalculate.text ?? ""
        textCurrentInputCalculate += textOperationDisplay
        self.lblTextInputCalculate.text = textCurrentInputCalculate
    }
    
    func displayCalNumber(resultPreCalNumber : String) {
        self.lblTextDisplayPreCalResult.text = resultPreCalNumber
    }
    
    func displayResultNumberEqual(result: String) {
        self.lblTextInputCalculate.text = result
        self.lblTextDisplayPreCalResult.text = ""
    }
    
    func displayClearNumber() {
        self.lblTextInputCalculate.text = ""
        self.lblTextDisplayPreCalResult.text = ""
    }
    
}

