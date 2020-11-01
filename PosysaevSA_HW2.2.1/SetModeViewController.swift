//
//  SetModeViewController.swift
//  PosysaevSA_HW2.2.1
//
//  Created by Sergei Posysaev on 01.11.2020.
//

import UIKit

protocol setModeViewColorDelegate {
    func setColor(with color: UIColor)
}

class SetModeViewController: UIViewController {

//    
//    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        //let settingColorVC = segue.source as! ViewController
//       
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destVC = segue.destination as? ViewController
        destVC?.colorFromSetting = view.backgroundColor
        destVC?.delegate = self
    }
}

extension SetModeViewController: setModeViewColorDelegate {

    func setColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
