//
//  RoundButton.swift
//  Calculator
//
//  Created by Jai on 27/04/21.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height/2
        }
    }
}
