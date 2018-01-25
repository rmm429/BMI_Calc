//
//  ThirdViewController.swift
//  BMI Calc
//
//  Created by Ricky Mangerie on 1/21/18.
//  Copyright © 2018 Ricky Mangerie. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollBMIChart: UIScrollView!
    
    @IBOutlet weak var imageBMIChart: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollBMIChart.minimumZoomScale = 1.0
        self.scrollBMIChart.maximumZoomScale = 6.0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.imageBMIChart
        
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
