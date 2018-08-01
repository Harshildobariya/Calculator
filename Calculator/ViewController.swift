//
//  ViewController.swift
//  Calculator
//
//  Created by Harshil sureshbhai dobariya on 04/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit

enum operation:String{
    
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
    case NULL = "Null"
}


class ViewController: UIViewController {
    
    @IBOutlet weak var outputlbl: UILabel!
    
    
    var runningnumber = ""
    var leftvalue = ""
    var rightvalue = ""
    var result = ""
    var currentoperation:operation = .NULL
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputlbl.text = "0"
        
    }
    
    
    @IBAction func numberpressed(_ sender: roundbutton) {
        if runningnumber.count<=8{
            runningnumber += "\(sender.tag)"
            outputlbl.text = runningnumber
        }
    }
    
    
    @IBAction func allclearpressed(_ sender: roundbutton) {
        runningnumber = ""
        leftvalue = ""
        rightvalue = ""
        result = ""
        outputlbl.text = "0"
    }
    
    
    @IBAction func dotpressed(_ sender: roundbutton) {
        if runningnumber.count <= 7{
            runningnumber += "."
            outputlbl.text = runningnumber
        }
    }
    
    
    @IBAction func equalpressed(_ sender: roundbutton) {
        operation(operation: currentoperation)
    }
    
    @IBAction func addpressed(_ sender: roundbutton) {
        operation(operation: .add)
    }
    
    
    @IBAction func subpressed(_ sender: roundbutton) {
        operation(operation: .sub)
    }
    
    @IBAction func mulpressed(_ sender: roundbutton) {
        operation(operation: .mul)
    }
    
    @IBAction func divpressed(_ sender: roundbutton) {
        operation(operation: .div)
    }
    func operation(operation: operation){
        if currentoperation != .NULL {
            if runningnumber != ""{
                rightvalue=runningnumber
                runningnumber=""
                
                if currentoperation == .add{
                    result = "\(Double(leftvalue)! + Double(rightvalue)!)"
                }else if currentoperation == .sub
                {
                    result = "\(Double(leftvalue)! - Double(rightvalue)!)"
                }else if currentoperation == .mul{
                    result = "\(Double(leftvalue)! * Double(rightvalue)!)"
                }else if currentoperation == .div{
                    result = "\(Double(leftvalue)! / Double(rightvalue)!)"
                }
                leftvalue = result
                
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int64(Double(result)!))"
                }
                
                outputlbl.text = result
            }
            currentoperation = operation
        }else {
            leftvalue = runningnumber
            runningnumber = ""
            currentoperation = operation
        }
    }
    
}


