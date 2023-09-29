//
//  Tipsy
//
//  Created by Kirill Romanov on 25.09.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var totalPerPerson: String = "0.0"
    var tips = 10
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if sender == zeroPctButton {
            tips = 0
        } else if sender == tenPctButton {
            tips = 10
        } else {
            tips = 20
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let numberOfPeole = Double(splitNumberLabel.text!)!
        let bill = Double(billTextField.text!) ?? 0
        let tipsPcs = Double(tips) / 100
        
        calculatingTotal(tipsPcs: tipsPcs, numberOfPeople: numberOfPeole, bill: bill)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    func calculatingTotal(tipsPcs: Double, numberOfPeople: Double, bill: Double) {
        totalPerPerson = String(format: "%.2f",(bill * (1 + tipsPcs)) / numberOfPeople)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = totalPerPerson
            destinationVC.numberOfPeople = splitNumberLabel.text!
            destinationVC.tipsPercentage = String(tips)
        }
    }
    
}

