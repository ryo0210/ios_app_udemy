//
//  ViewController.swift
//  Calculator
//
//  Created by ryo on 2020/04/26.
//  Copyright © 2020 ryo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypeNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("display labelのtextをDuble型に変換できません。")
            }
            return number
        } set {
            displayLabel.text = String(newValue)
        }
    }
    
    // 他のクラスがprivate宣言子をつける。
    private var calculator = CalculatorLogic()

    @IBAction func calButtonPressed(_ sender: UIButton) {
        
        isFinishedTypeNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
                        
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypeNumber {
                displayLabel.text = numValue
                isFinishedTypeNumber = false
            } else {
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

