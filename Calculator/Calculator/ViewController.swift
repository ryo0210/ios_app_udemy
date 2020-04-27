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
    

    @IBAction func calButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypeNumber {
                displayLabel.text = numValue
                isFinishedTypeNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

