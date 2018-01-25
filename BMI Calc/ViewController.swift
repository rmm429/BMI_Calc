//
//  ViewController.swift
//  BMI Calc
//
//  Created by Ricky Mangerie on 1/9/18.
//  Copyright © 2018 Ricky Mangerie. All rights reserved.
//

import UIKit

// creating an extention of the Double class
extension Double
{
    // creating a function call round that rounds a Double to a certain amount of decimal places
    // takes an Int as a parameter and returns a Double
    func round(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textLbs: UITextField!
    @IBOutlet weak var textFeet: UITextField!
    @IBOutlet weak var textInches: UITextField!
    
    @IBOutlet weak var labelBMIDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLbs.keyboardType = UIKeyboardType.numberPad
        textFeet.keyboardType = UIKeyboardType.numberPad
        textInches.keyboardType = UIKeyboardType.numberPad
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        
        self.textLbs.resignFirstResponder()
        self.textFeet.resignFirstResponder()
        self.textInches.resignFirstResponder()
        
        let lbsInt = Int(textLbs.text!)
        let feetInt = Int(textFeet.text!)
        let inchesInt = Int(textInches.text!)
        
        if lbsInt == nil || lbsInt! <= 0
        {
            self.labelBMIDesc.text = "Invalid weight input\nEnter a positive integer for lbs"
        }
        else if feetInt == nil || feetInt! <= 0
        {
            self.labelBMIDesc.text = "Invalid height input\nEnter a positive integer for feet"
        }
        else if inchesInt == nil || inchesInt! < 0 || inchesInt! > 11
        {
            self.labelBMIDesc.text = "Invalid height input\nEnter 0 through 11 for inches"
        }
        else
        {
            let lbsDbl : Double = Double(lbsInt!)
            let feetDbl : Double = Double(feetInt!)
            let inchesDbl : Double = Double(inchesInt!)
            
            calculateBMI(feet: feetDbl, inches: inchesDbl, weight: lbsDbl)
            
        }
        
    }
    
    // function that calculates BMI with three Double inputs
    func calculateBMI(feet : Double, inches : Double, weight : Double)
    {
        // converting pounds to kilograms
        let poundsToKilograms = weight * 0.453592
        
        // creating a decimal from the feet and inches
        let height = feet + (inches/12.0)
        //converting feet to meters
        let feetToMeters = height * 0.3048
        
        // calculating the BMI
        let BMI = (poundsToKilograms/(pow(feetToMeters, 2))).round(places: 2) // rounding the BMI decimal to 2 places
        
        // Conditional Statement
        if BMI >= 30.0
        {
            self.labelBMIDesc.text = "Your BMI is \(BMI)\nYou are obese"
        }
        else if BMI >= 25.0 && BMI < 30.0
        {
            self.labelBMIDesc.text = "Your BMI is \(BMI)\nYou are overweight"
        }
        else if BMI >= 18.5 && BMI < 25
        {
            self.labelBMIDesc.text = "Your BMI is \(BMI)\nYou are normal weight"
        }
        else if BMI < 18.5
        {
            self.labelBMIDesc.text = "Your BMI is \(BMI)\nYou are underweight"
        }
    }
    
}

