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
    case NULL = "NIL"
}
class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var currentNumber = ""
    var leftOperand = ""
    var rightOperand = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
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
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if currentNumber.count <= 8{
            currentNumber += "."
            outputLabel.text = currentNumber
        }
        
    }
    @IBAction func backPressed(_ sender: RoundButton) {
        currentNumber = outputLabel.text!
        currentNumber.remove(at: currentNumber.index(before: currentNumber.endIndex))
        outputLabel.text = currentNumber
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        calculate(operation: currentOperation)
        currentOperation = .NULL
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        calculate(operation: .Add)
    }
    @IBAction func subPressed(_ sender: RoundButton) {
        calculate(operation: .Sub)
    }
    
    @IBAction func multiPressed(_ sender: RoundButton) {
        calculate(operation: .Multiply)
    }
    @IBAction func divPressed(_ sender: RoundButton) {
        calculate(operation: .Divide)
    }
    
    func calculate(operation: Operation){
        if currentOperation != .NULL{
            if currentNumber != ""{
                rightOperand = currentNumber
                currentNumber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(leftOperand)! + Double(rightOperand)!)"
                }else if currentOperation == .Sub{
                    result = "\(Double(leftOperand)! - Double(rightOperand)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftOperand)! * Double(rightOperand)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftOperand)! / Double(rightOperand)!)"
                }
                leftOperand = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        }else{
            leftOperand = currentNumber
            currentNumber = ""
            currentOperation = operation
        }
        
        
    }
}

