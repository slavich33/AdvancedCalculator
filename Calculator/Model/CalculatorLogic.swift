//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Slava on 24.04.2021.
//  Copyright © 2021 Slava Chu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorLogic {
    
    
   private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
   private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
   mutating func calculate(symbol: String) -> Double? {
        
    if let n = number {
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return n * -1
        case "%":
            return n / 100
        case "=":
           return performTwoNumberCalculation(n2: n)
        default:
            intermediateCalculation = (n1: n, calcMethod: symbol)
        }
    }
    return nil
   }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            case "-":
                return n1 - n2
            default:
                fatalError("The operation passed is does not match any cases")
            }
//            if operation == "+" {
//                return n1 + n2
//            } else if operation == "×" {
//                return n1 * n2
//            } else if operation == "÷" {
//               return n1 / n2
//            } else if operation == "-" {
//                return n1 - n2
//            }
        }
        return nil
    }
    
}

