//
//  Fixture.swift
//  Obligatorio3v1
//
//  Created by SP07 on 10/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class Fixture: Mappable {
    var homeTeamName: String?
    var awayTeamName: String?
    var goalsHomeTeam: Int?
    var goalsAwayTeam: Int?
    var date: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping (map: Map){
        self.homeTeamName <- map ["homeTeamName"]
        self.awayTeamName <- map ["awayTeamName"]
        self.goalsHomeTeam <- map ["result.goalsHomeTeam"]
        self.goalsAwayTeam <- map ["result.goalsAwayTeam"]
        self.date <- map ["date"]
    }
}
