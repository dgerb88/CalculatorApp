//
//  ViewController.swift
//  calculatorApp
//
//  Created by Dax Gerber on 8/31/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainLabel: UILabel!
    var currentNumber = 0.0
    var previousNumber: Double?
    var operation = ""
    var resultNumber = 0.0
    var didDoAnother = false
    var currentNumberString = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        switch sender.tag {
        case 1...10:
            currentNumberString += String(sender.tag - 1)
            currentNumber = Double(currentNumberString)!
            mainLabel.text = String(currentNumber)
        case 11: //Divided
            previousNumber = currentNumber
            operation = "/"
            currentNumberString.removeAll()
        case 12: // Multiply
            previousNumber = currentNumber
            operation = "*"
            currentNumberString.removeAll()
        case 13: // Subtract
            previousNumber = currentNumber
            operation = "-"
            currentNumberString.removeAll()
        case 14: // Add
            previousNumber = currentNumber
            operation = "+"
            currentNumberString.removeAll()
        case 15: // Equals
            // complete operation
            guard previousNumber != nil else { break }
            switch operation {
                case "/":
                if !didDoAnother {
                    resultNumber = previousNumber! / currentNumber
                    currentNumber = resultNumber
                } else {
                    resultNumber = previousNumber! / currentNumber
                    currentNumber = resultNumber
                }
                case "*":
                    resultNumber = currentNumber * previousNumber!
                    currentNumber = resultNumber
                case "-":
                if !didDoAnother {
                    resultNumber = previousNumber! - currentNumber
                    currentNumber = resultNumber
                } else {
                    resultNumber = previousNumber! - currentNumber
                    currentNumber = resultNumber
                }
                case "+":
                    resultNumber = currentNumber + previousNumber!
                    currentNumber = resultNumber
                default:
                    break
            }
            mainLabel.text = String(resultNumber)
            didDoAnother = true
            currentNumberString.removeAll()
            
            
        case 16: //Clear
            currentNumber = 0.0
            previousNumber = nil
            operation = ""
            mainLabel.text = "0"
            didDoAnother = false
            currentNumberString = ""
        default:
            break
        }
        
        
        
        
    }
    
}

