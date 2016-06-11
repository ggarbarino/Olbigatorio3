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
    
    private let baseURL = "http://api.football-data.org/v1/soccerseasons/424/fixtures"
    
    private init() {
        
    }
    
    func FixtureOnCompletion(onCompletion: (fixture: [Fixture]?, error: NSError?) -> Void) {
        
        
        Alamofire.request(.GET, self.baseURL).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
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