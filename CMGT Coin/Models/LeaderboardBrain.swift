//
//  LeaderboardBrain.swift
//  CMGT Coin
//
//  Created by Frank Solleveld on 14/04/2020.
//  Copyright © 2020 Frank Solleveld. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Lead: Codable {
    let name: String // 0940599
    let coins: Int // 75
}

struct LeaderboardBrain {
    let apiUrl = URL(string: "https://programmeren9.cmgt.hr.nl:8000/api/users")
    let session = URLSession.shared
    
    lazy var lead: [Lead] = [
        Lead(name: "0940599", coins: 74),
        Lead(name: "0940590", coins: 300)
    ]
    
    mutating func performApiCallToLeaderboard() {
        if let url = apiUrl {
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err)
                } else if let d = data {
                    self.lead = self.parseJSON(with: d)
                }
            }
            task.resume()
        }
    }
    
   func parseJSON(with json: Data) -> [Lead] {
        let j = JSON(json)
        var l: [Lead] = []
        for d in j {
            let s = Lead(name: d.0, coins: d.1.intValue)
            l.append(s)
        }
        return l
    }
}
