//
//  LeaderboardTableViewController.swift
//  CMGT Coin
//
//  Created by Frank Solleveld on 14/04/2020.
//  Copyright © 2020 Frank Solleveld. All rights reserved.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {

    var leaderboardBrain = LeaderboardBrain()
    
    var leaderboard: [Lead] = [
        Lead(name: "0940599", coins: 74),
        Lead(name: "0940590", coins: 300)
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        DispatchQueue.main.async {
            let result = self.leaderboardBrain.performApiCallToLeaderboard()
            if result.isEmpty {
                print("The call resulted in an empty array.")
            } else {
                self.leaderboard = self.leaderboardBrain.sortJSONIntoArray(json: result)
            }
        }
    }

    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboard.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lead = leaderboard[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Table.leaderboardCell, for: indexPath)
    
        cell.textLabel?.text = "\(indexPath.row + 1). \(lead.name)"
        cell.detailTextLabel?.text = "\(String(lead.coins)) coins"
        
        return cell
    }
}
