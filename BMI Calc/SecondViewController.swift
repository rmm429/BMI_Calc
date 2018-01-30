//
//  SecondViewController.swift
//  BMI Calc
//
//  Created by Ricky Mangerie on 1/21/18.
//  Copyright © 2018 Ricky Mangerie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textKg: UITextField!
    @IBOutlet weak var textMeters: UITextField!
    
    @IBOutlet weak var labelBMIDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling the load() function
        load_Metric()
        
        textKg.keyboardType = UIKeyboardType.decimalPad
        textMeters.keyboardType = UIKeyboardType.decimalPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        
        self.textKg.resignFirstResponder()
        self.textMeters.resignFirstResponder()
        
        let kg = Double(textKg.text!)
        let meters = Double(textMeters.text!)
        
        if kg == nil || kg! <= 0
        {
            self.labelBMIDesc.text = "Invalid weight input\nEnter a positive integer for lbs"
        }
        else if meters == nil || meters! <= 0
        {
            self.labelBMIDesc.text = "Invalid height input\nEnter a positive integer for feet"
        }
        else
        {
            
            let kgDbl : Double = Double(kg!)
            let metersDbl : Double = Double(meters!)
            
            
            calculateBMI(kg: kgDbl, meters: metersDbl)
        }
        
    }
    
    // function that calculates BMI with two Double inputs
    func calculateBMI(kg : Double, meters : Double)
    {
        // calculating the BMI
        let BMI = (kg/(pow(meters, 2))).round(places: 2) // rounding the BMI decimal to 2 places
        
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
        
        //Calling the save() function
        save_Metric()
    }
    
    //Function that saves user-entered data and app-produced data
    func save_Metric()
    {
        //Creating a standard UserDefaults called defaults
        let defaults_Metric = UserDefaults.standard
        
        //Setting the text for labelBMIDesc
        defaults_Metric.set(labelBMIDesc.text, forKey: "labelBMIDesc")
        //Saving the text for textKg
        defaults_Metric.set(textKg.text, forKey: "textKg")
        //Saving the text for textMeters
        defaults_Metric.set(textMeters.text, forKey: "textMeters")
        
        //Synchronizing defaults
        defaults_Metric.synchronize()
    }
    
    func load_Metric()
    {
        //Creating a standard UserDefaults called defaults
        let defaults_Metric = UserDefaults.standard
        
        //Setting the labelBMIDesc text to the previously-saved data
        labelBMIDesc.text = defaults_Metric.object(forKey: "labelBMIDesc") as? String
        //Setting the textKg text to the previously-saved data
        textKg.text = defaults_Metric.object(forKey: "textLbs") as? String
        //Setting the textMeters text to the previously-saved data
        textMeters.text = defaults_Metric.object(forKey: "textFeet") as? String
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
