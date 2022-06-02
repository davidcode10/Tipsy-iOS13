//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by David Santiago on 1/6/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalByPeople: String?
    var numberOfPeople: String?
    var tipSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        totalLabel.text = totalByPeople
        settingsLabel.text = "Split between \(numberOfPeople ?? "2") people, with \(tipSelected ?? "10") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
