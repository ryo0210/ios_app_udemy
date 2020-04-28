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

    @IBAction func calButtonPressed(_ sender: UIButton) {
        
        isFinishedTypeNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01
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
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("display labelのtextをDoble型に変換できません。")
                    }
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
                    
            }
        }
    }
    
}

