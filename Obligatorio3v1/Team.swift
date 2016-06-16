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
    var URLflag: String?
    var teamFixture: String?
    required init?(_ map: Map) {
    
    }

    func mapping (map: Map){
        self.name <- map ["name"]
        self.URLflag <- map ["crestUrl"]
        self.teamFixture <- map ["fixtures.href"]
    }
}
