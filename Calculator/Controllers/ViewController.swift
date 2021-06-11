//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var finishingTypingNumber: Bool = true
    
    var displayValue: Double {
        get {
            guard let dv = Double(displayLabel.text!) else {
                fatalError("Cannot convert DisplayLabel Text into Double") }
            return dv
        }
        set {
            displayLabel.text! = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        finishingTypingNumber = true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod)  {
                displayValue = result
            }
            
        }
        //    Then we just set our diplay value, which was setter
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if finishingTypingNumber {
                displayLabel.text = numValue
                finishingTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                displayLabel.text?.append(numValue)
            }
            //        What should happen when a number is entered into the keypad
            
        }
    }
}
