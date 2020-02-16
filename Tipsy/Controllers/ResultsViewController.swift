//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Johnny Hacking on 2/15/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amtBill: String?
    var amtLabel: String?
    
    @IBOutlet weak var totalLable: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLable.text = amtBill
        settingsLabel.text = amtLabel
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
   
}
