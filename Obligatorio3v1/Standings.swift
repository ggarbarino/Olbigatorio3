//
//  Standings.swift
//  Obligatorio3v1
//
//  Created by SP07 on 16/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class Standings: Mappable {
    var grupA: [Team]?
    var grupB: [Team]?
    var grupC: [Team]?
    var grupD: [Team]?
    var grupE: [Team]?
    var grupF: [Team]?
    
    
    required init?(_ map: Map) {
        
    }
    
    func mapping (map: Map){
        self.grupA <- map ["standings.A"]
        self.grupB <- map ["standings.B"]
        self.grupC <- map ["standings.C"]
        self.grupD <- map ["standings.D"]
        self.grupE <- map ["standings.E"]
        self.grupF <- map ["standings.F"]

    }
}

