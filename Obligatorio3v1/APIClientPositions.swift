//
//  APIClientPositions.swift
//  Obligatorio3v1
//
//  Created by SP07 on 16/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import Alamofire
import ObjectMapper

class APIClientPositions {
    
    static let sharedClient = APIClientPositions()
    
    
    private let baseURL = "http://api.football-data.org/v1/soccerseasons/424/leagueTable"
    private init() {
        
    }
    
    func footballOnCompletion(onCompletion: (standings: Standings?, error: NSError?) -> Void) {
        
        
        Alamofire.request(.GET, self.baseURL, headers:["X-Auth-Token":"d2c9b223d3054fcb89fd740bc93a88d0"]).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            print(response)
            switch response.result {
                
            case .Failure(let error):
                onCompletion(standings: nil, error: error)
            case .Success(let value):
                
                if let standings = Mapper<Standings>().map(value) {
                    
                    onCompletion(standings: standings, error: nil)
                }else {
                    onCompletion(standings: nil, error: NSError(domain: "MyApp", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Fallo el mapeo"]))
                }
            }
            
        }
    }
    
}