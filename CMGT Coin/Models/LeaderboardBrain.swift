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

class LeaderboardBrain {
    let apiUrl = URL(string: "https://programmeren9.cmgt.hr.nl:8000/api/users")
    let session = URLSession.shared
    static let shared = LeaderboardBrain()
    
    var leaderboard: [Lead] = []
    
    func performApiCallToLeaderboard() {
        if let url = apiUrl {
            let task = session.dataTask(with: url) { (data, _, error) in
                if let err = error {
                    print(err)
                } else if let d = data {
                    self.leaderboard = self.sortJSONIntoArray(json: d)
                    print("[LeaderboardBrain] Leaderboard has been filled.")
                }
            }
            task.resume()
        }        
    }
    
    func sortJSONIntoArray(json: Data) -> [Lead] {
        // Data has been retrieved and will be JSON'ed and sorted out.
        let j = JSON(json)
        var l: [Lead] = []
        for v in j {
            if v.0 == K.TableBrain.removableString {
                let s = Lead(name: "Undefined", coins: v.1.intValue)
                l.append(s)
            } else {
                let s = Lead(name: v.0, coins: v.1.intValue)
                l.append(s)
            }
        }
        return l.sorted(by: { $0.coins > $1.coins })
    }
}
