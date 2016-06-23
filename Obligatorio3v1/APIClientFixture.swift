//
//  APIClient.swift
//  ClaseNetworking
//
//  Created by Administrador on 18/5/16.
//
//

import Alamofire
import ObjectMapper

class APIClientFixture {
    
    static let sharedClient = APIClientFixture()
    
    private var baseURL = ""
    
    private init() {
        
    }
    
    func fixtureOnCompletion(origin: String?, onCompletion: (fixture: [Fixture]?, error: NSError?) -> Void) {
        if (origin == "global"){
            baseURL = "http://api.football-data.org/v1/soccerseasons/424/fixtures"
        }
        else{
            baseURL = origin!
        }
        
        Alamofire.request(.GET, self.baseURL, headers:["X-Auth-Token":"d2c9b223d3054fcb89fd740bc93a88d0"]).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            print(response)
            switch response.result {
                
            case .Failure(let error):
                onCompletion(fixture: nil, error: error)
            case .Success(let value):
                
                if let fixture = Mapper<Fixture>().mapArray(value["fixtures"]) {
                    
                    onCompletion(fixture: fixture, error: nil)
                }else {
                    onCompletion(fixture: nil, error: NSError(domain: "MyApp", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Fallo el mapeo"]))
                }
            }
            
        }
    }
    
}

