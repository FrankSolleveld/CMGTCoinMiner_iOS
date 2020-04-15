//
//  LeaderboardBrain.swift
//  CMGT Coin
//
//  Created by Frank Solleveld on 14/04/2020.
//  Copyright © 2020 Frank Solleveld. All rights reserved.
//

import UIKit
import Alamofire

struct Lead {
    let name: String // 0940599
    let coins: Int // 75
}

struct LeaderboardBrain {
    let leaderboard: [Lead] = [
        Lead(name: "0940599", coins: 74),
        Lead(name: "0940590", coins: 300)
    ]
    private let apiUrl = "https://programmeren9.cmgt.hr.nl:8000/api/"
    private let apiUrlUsers = "users"
    
    func getLeaderboard() {
       
        AF.request("\(apiUrl)\(apiUrlUsers)").responseJSON { response in
            print(response)
        }
        
    }
    
}
