//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTip = 0.10
    var numberOfPeople = 2.0
    var totalbill = 0.0
    var finalResult = 0.0
    var tipSelected = "10%"
    var inTheParty = "0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        tipSelected = sender.currentTitle!
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tip = sender.currentTitle!
        let tipMinusPct = String(tip.dropLast())
        let tipAsNumber = Double(tipMinusPct)!
        selectedTip = tipAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        inTheParty = String(format: "%.0f", sender.value)
        billTextField.endEditing(true)
        numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text?.replacingOccurrences(of: ",", with: ".")
        
        if bill != "" {
            
            let billToPay = Double(bill!)
            
            let totalTip = (billToPay ?? 0.0) * selectedTip
            
            let totalBill = (billToPay ?? 0.0) + totalTip
            finalResult = totalBill / numberOfPeople
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalByPeople = String(format: "%.2f", finalResult)
            destinationVC.numberOfPeople = String(inTheParty)
            destinationVC.tipSelected = String("\(tipSelected)")
        }
    }
    
}

