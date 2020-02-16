//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var pctButton: String = ""
    var pctButtonValue: Double = 0.00
    var stepperValue = 2.0
    var billAmount: String = ""

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        // This code will hide the keyboard when a percent is clicked.
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = true
        pctButton = sender.titleLabel?.text ?? "0%"
        if pctButton == "0%"{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            pctButtonValue = 0.0
        } else if pctButton == "10%"{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            pctButtonValue = 0.1
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            pctButtonValue = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        stepperValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", stepperValue)
    
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToTip", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        billAmount = billTextField.text ?? "0.0"
        let decBillValue = Double(billAmount) ?? 0
        //amount to be split
        let totalAmount = ((decBillValue * pctButtonValue) + decBillValue) / stepperValue
        
        if segue.identifier == "goToTip"{
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.amtBill = String(format:"%.2f",totalAmount)
            destinationVC.amtLabel = "Split between \(String(format: "%.0f", stepperValue)) people with \(pctButton) tip"
        }
        
        
    }
}

