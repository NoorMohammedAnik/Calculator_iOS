//
//  ViewController.swift
//  Calculator
//
//  Created by Noor Mohammed Anik on 5/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOparation : Operator = Operator.nothing
    var calState : calculationState = calculationState.enteringNum
    var firstValue: String = ""
    
    

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    //button function
    @IBAction func numberClicked(_ sender: UIButton)
    {
        
        updateDisplay(number : String(sender.tag))
    }
    
    
    func updateDisplay(number : String)
    {
        if calState == calculationState.newNumStarted
        {
            if let num=resultLabel.text
            {
                if num != ""{
                    
                    firstValue=num
                }
            }
            
            calState = calculationState.enteringNum
            resultLabel.text=number
        }
        
        else if calState == calculationState.enteringNum{
            resultLabel.text=resultLabel.text! + number
        }
    }
    
    //operator function
    @IBAction func operatorClicked(_ sender: UIButton)
    {
        
        calState = calculationState.newNumStarted
        
        if let num=resultLabel.text {
            if num != "" {
                firstValue = num
                
                resultLabel.text = ""
                
            }
        }
        
        updateOperatorButton(tag: sender.tag)
        
        switch (sender.tag) {
        
        case 10:
            currentOparation = Operator.add
            
        case 11:
            currentOparation = Operator.subtract
        
            
        case 12:
            currentOparation = Operator.times
            
        case 13:
            currentOparation = Operator.divide
        default:
            print("DEFAULT")
        }
        
    }
    
    //equal function
    @IBAction func equalClicked(_ sender: UIButton)
    {
        calculateSum()
        
    }
    
    
    func calculateSum()
    {
        if (firstValue.isEmpty){
            return
        }
        
        var result = ""
        
        if currentOparation == Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        
        else if currentOparation == Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        
       else if currentOparation == Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        
        
        else if currentOparation == Operator.subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text=result
        
        calState=calculationState.newNumStarted
        
        
    }

    
    
    func updateOperatorButton(tag : Int)
    {
        //clear colors
        
        for var i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
                
            }
        }
        
        
        if let button = self.view.viewWithTag(tag) as? UIButton {
       
            button.backgroundColor = UIColor.yellow
            
            
        }
    }
}

