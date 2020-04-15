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
    var lb: [Lead] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        leaderboardBrain.performApiCallToLeaderboard()
        // sorted method sorts leads with most coins at top, thhen descends to lower tiers.
        lb = leaderboardBrain.lead.sorted(by: { $0.coins > $1.coins })
    }

    // MARK: - Table view data source
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
