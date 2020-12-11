//
//  MinerViewController.swift
//  CMGT Coin
//
//  Created by Frank Solleveld on 16/04/2020.
//  Copyright © 2020 Frank Solleveld. All rights reserved.
//

import UIKit

class MinerViewController: UIViewController {

    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var nameInputField: UITextField!
    @IBOutlet weak var mineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func mineButtonPressed(_ sender: UIButton) {
        
        // Send API call to /next
        print(CoinMiner.shared.getLatestTransaction())
        
    }
    
}
