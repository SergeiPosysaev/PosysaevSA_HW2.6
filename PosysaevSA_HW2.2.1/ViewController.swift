//
//  ViewController.swift
//  PosysaevSA_HW2.2.1
//
//  Created by Sergei Posysaev on 15.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForColors: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var blueValueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewForColors.backgroundColor = setNewColor()
        
    }

    private func setValuesLbl() {
        redValueLabel.text = String(roundf(redValueSlider.value * 10) / 10)
        greenValueLabel.text = String(roundf(greenValueSlider.value * 10) / 10)
        blueValueLabel.text = String(roundf(blueValueSlider.value * 10) / 10)
    }
    private func setNewColor() -> UIColor {
        UIColor(red: CGFloat(redValueSlider.value),
                green: CGFloat(greenValueSlider.value),
                blue: CGFloat(blueValueSlider.value),
                alpha: 1)
    }
    
    
    
    @IBAction func redActionSlider() {
        setValuesLbl()
        viewForColors.backgroundColor = setNewColor()
       
    }
    
    @IBAction func greenActionSlider() {
        setValuesLbl()
        viewForColors.backgroundColor = setNewColor()
    }
    
    @IBAction func blueActionSlider() {
        setValuesLbl()
        viewForColors.backgroundColor = setNewColor()
    }
    
}



