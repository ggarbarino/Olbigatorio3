//
//  Team.swift
//  Obligatorio3v1
//
//  Created by SP07 on 9/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import Foundation
import ObjectMapper

class Team: Mappable {
    var name: String?
    var teamFixture: String?
    var points: Int?
    var goalsDifference: Int?
    var rank: Int?
    var team: String?
    var playedGames: Int?
    
    required init?(_ map: Map) {
    
    }

    func mapping (map: Map){
        self.name <- map ["name"]
        self.teamFixture <- map ["_links.fixtures.href"]

        self.points <- map ["points"]
        self.goalsDifference <- map ["goalDifference"]
        self.rank <- map ["rank"]
        self.team <- map ["team"]
        self.playedGames <- map ["playedGames"]
        
     
    }
}
