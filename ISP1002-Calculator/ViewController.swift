//
//  ViewController.swift
//  ISP1002-Calculator_Assignment
//
//  Created by Divya on 07/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    var inputString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    var isValidInput: Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        var previous = -1
        for char in inputString {
            if specialCharacter(char: char) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        for index in funcCharIndexes {
            if index == 0 {
                return false
            }
            if index == inputString.count - 1 {
                return false
            }
            if previous != -1 {
                if index - previous == 1 {
                    return false
                }
            }
            previous = index
        }
        return true
    }

    @IBAction func equalAction(_ sender: Any) {
        if isValidInput {
            let checkedWorkingsForPercent = inputString.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let expr = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = result(result: expr)
            outputLabel.text = resultString
        } else {
            showErrorAlert()
        }
    }
    
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        return false
    }
    
    func result(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        reset()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!inputString.isEmpty) {
            inputString.removeLast()
            inputLabel.text = inputString
        }
    }
    
    @IBAction func xSquare(_ sender: Any) {
        if let input = inputLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = dValue * dValue
            outputLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func sinTap(_ sender: Any) {
        if let input = inputLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = sin(dValue)
            outputLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func cosTap(_ sender: Any) {
        if let input = inputLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = cos(dValue)
            outputLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func tanTap(_ sender: Any) {
        if let input = inputLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = tan(dValue)
            outputLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    func addToCalculations(value: String) {
        inputString = inputString + value
        inputLabel.text = inputString
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToCalculations(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToCalculations(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToCalculations(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToCalculations(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToCalculations(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToCalculations(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToCalculations(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToCalculations(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToCalculations(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToCalculations(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToCalculations(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToCalculations(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToCalculations(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToCalculations(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToCalculations(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToCalculations(value: "9")
    }
    
    
    func reset() {
        inputString = ""
        inputLabel.text = ""
        outputLabel.text = ""
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(
            title: "Invalid Input",
            message: "Please enter a valid input",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

