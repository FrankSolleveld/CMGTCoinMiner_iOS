//
//  LeaderboardTableViewController.swift
//  CMGT Coin
//
//  Created by Frank Solleveld on 14/04/2020.
//  Copyright © 2020 Frank Solleveld. All rights reserved.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {

    var leaderboardBrain = LeaderboardBrain.shared
    
    var lb: [Lead] = [
        Lead(name: "0940599", coins: 74),
        Lead(name: "0940590", coins: 300)
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        DispatchQueue.main.async {
            if self.leaderboardBrain.leaderboard.isEmpty {
                print("The call resulted in an empty array.")
            } else {
                self.lb = []
                self.lb = self.leaderboardBrain.leaderboard
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lb.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lead = lb[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Table.leaderboardCell, for: indexPath)
    
        cell.textLabel?.text = "\(indexPath.row + 1). \(lead.name)"
        cell.detailTextLabel?.text = "\(String(lead.coins)) coins"
        
        return cell
    }
}
