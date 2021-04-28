//
//  ViewController.swift
//  Calculator
//
//  Created by Jai on 27/04/21.
//

import UIKit
enum Operation:String{
    case Add = "+"
    case Sub = "-"
    case Divide = "/"
    case Multiply = "*"
    case equal = "equal"
}
class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var currentNumber = ""
    var leftOperand = ""
    var rightOperand = ""
    var result = ""
    var currentOperation:Operation = .equal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
        // Do any additional setup after loading the view.
    }
    
    override open var shouldAutorotate: Bool{
        return false
    }
    @IBAction func numberPressed(_ sender: RoundButton) {
        if currentNumber.count <= 8 {
            currentNumber += "\(sender.tag)"
            outputLabel.text = currentNumber
        }
        
    }
    
    @IBAction func clearPressed(_ sender: RoundButton) {
        currentNumber = ""
        leftOperand = ""
        rightOperand = ""
        result = ""
        currentOperation = .equal
        outputLabel.text = "0"
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if currentNumber.count <= 8{
            currentNumber += "."
            outputLabel.text = currentNumber
        }
        
    }
    @IBAction func backPressed(_ sender: RoundButton) {
        if let currentNum = outputLabel.text{
            currentNumber = currentNum
            if currentNum.count == 1{
                currentNumber = ""
                outputLabel.text = "0"
            }else{
                currentNumber.remove(at: currentNumber.index(before: currentNumber.endIndex))
                outputLabel.text = currentNumber
            }
            
           
        }
        
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        calculate(operation: currentOperation)
        currentOperation = .equal
        
    }
    
    @IBAction func operatorPressed(_ sender: RoundButton) {
        if currentOperation == .equal{
            currentNumber = outputLabel.text!
        }
        let operatorPress = sender.tag
        switch  operatorPress {
        case 0: calculate(operation: .Add)
        case 1: calculate(operation: .Sub)
        case 2: calculate(operation: .Multiply)
        case 3: calculate(operation: .Divide)
        default:
            break
        }
    }
    
    func calculate(operation: Operation){
        if currentOperation != .equal{
            guard !currentNumber.isEmpty else {
                return
            }
            rightOperand = currentNumber
            currentNumber = ""
            guard let leftValue = Double(leftOperand), let rightValue = Double(rightOperand) else {
                return
            }
            
            switch currentOperation{
            case .Add : result = "\(leftValue + rightValue)"
            case .Sub : result = "\(leftValue - rightValue)"
            case .Multiply : result = "\(leftValue * rightValue)"
            case .Divide : result = "\(leftValue / rightValue)"
            default: break
            }
            
            leftOperand = result
            
            if let unwrappedResult = Double(result), unwrappedResult.truncatingRemainder(dividingBy: 1) == 0{
                result = "\(Int(unwrappedResult))"
            }
            outputLabel.text = result
            currentOperation = operation
            
        }else{
            leftOperand = currentNumber
                currentNumber = ""
            currentOperation = operation
        }
        
        
    }
}

