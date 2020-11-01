//
//  ViewController.swift
//  PosysaevSA_HW2.2.1
//
//  Created by Sergei Posysaev on 15.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewForColors: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var blueValueSlider: UISlider!
    
    
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var executeBtn: UIButton!
    
    // MARK: - variable
    
    var delegate: SetModeViewController?
    var colorFromSetting: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliderValueFromColor(mainColor: colorFromSetting)
        viewForColors.backgroundColor = colorFromSetting ?? setNewColor()
        executeBtn.layer.cornerRadius = 10
        viewForColors.layer.cornerRadius = 12
        navigationItem.setHidesBackButton(true, animated: false)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }

    // MARK: - Inner functions
    
    private func errorMessage(title: String, message: String, tagTF: Int) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            self.redTextField.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true) {
        }
    }
    
    private func setValuesToLabels(redValue: Float,
                                   greenValue: Float,
                                   blueValue: Float) {
        redValueLabel.text = String(roundf(redValue * 10) / 10)
        greenValueLabel.text = String(roundf(greenValue * 10) / 10)
        blueValueLabel.text = String(roundf(blueValue * 10) / 10)
        
        redTextField.text = redValueLabel.text
        greenTextField.text = greenValueLabel.text
        blueTextField.text = blueValueLabel.text
    }
    
    private func setSliderValueFromColor(mainColor: UIColor) {
        let ciColor = CIColor(color: mainColor)
        redValueSlider.value = Float(ciColor.red)
        greenValueSlider.value = Float(ciColor.green)
        blueValueSlider.value = Float(ciColor.blue)
        
        setValuesToLabels(redValue: redValueSlider.value,
                          greenValue: greenValueSlider.value,
                          blueValue: blueValueSlider.value)
    }
    
    private func setNewColor() -> UIColor {
        let newColor = UIColor(red: CGFloat(redValueSlider.value),
                green: CGFloat(greenValueSlider.value),
                blue: CGFloat(blueValueSlider.value),
                alpha: 1)
        return newColor
    }
    
    // MARK: - IBActions
    
    @IBAction func anySlidersMove(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redValueLabel.text = String(roundf(redValueSlider.value * 10) / 10)
            viewForColors.backgroundColor = setNewColor()
            redTextField.text = redValueLabel.text
        case 1:
            greenValueLabel.text = String(roundf(greenValueSlider.value * 10) / 10)
            viewForColors.backgroundColor = setNewColor()
            greenTextField.text = greenValueLabel.text
        case 2:
            blueValueLabel.text = String(roundf(blueValueSlider.value * 10) / 10)
            viewForColors.backgroundColor = setNewColor()
            blueTextField.text = blueValueLabel.text
        default:
            break
        }
    }
    
    @IBAction func executeBtn(_ sender: UIButton) {
        delegate?.setColor(with: setNewColor())
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - extention

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        redValueSlider.value = Float(redTextField.text ?? "0")!
        greenValueSlider.value = Float(greenTextField.text ?? "0")!
        blueValueSlider.value = Float(blueTextField.text ?? "0")!
        
        setValuesToLabels(redValue: redValueSlider.value,
                          greenValue: greenValueSlider.value,
                          blueValue: blueValueSlider.value)
        viewForColors.backgroundColor = setNewColor()
        
        textField.resignFirstResponder()
        return true
    }
    
}

