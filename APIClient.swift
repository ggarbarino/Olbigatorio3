//
//  APIClient.swift
//  ClaseNetworking
//
//  Created by Administrador on 18/5/16.
//
//

import Alamofire
import ObjectMapper

class APIClient {
    
    static let sharedClient = APIClient()
    

    private let baseURL = "http://api.football-data.org/v1/soccerseasons/424/teams"
    private init() {
        
    }
    
    func footballOnCompletion(onCompletion: (team: [Team]?, error: NSError?) -> Void) {
        
        
        Alamofire.request(.GET, self.baseURL).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            print(response)
            switch response.result {
                
            case .Failure(let error):
                onCompletion(team: nil, error: error)
            case .Success(let value):
                
                if let team = Mapper<Team>().mapArray(value["teams"]) {
                    
                    onCompletion(team: team, error: nil)
                }else {
                    onCompletion(team: nil, error: NSError(domain: "MyApp", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Fallo el mapeo"]))
                }
            }
            
        }
    }
    
}