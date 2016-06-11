//
//  ViewControllerFixture.swift
//  Obligatorio3v1
//
//  Created by SP07 on 10/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//


import UIKit
import DateTools

class ViewControllerFixture: UIViewController {
    var fixture: [Fixture]?
    
    @IBOutlet weak var tableViewFixture: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        APIClientFixture.sharedClient.FixtureOnCompletion { (fixture, error) -> Void in
            
            if let fixture = fixture {
                self.fixture = fixture
                self.tableViewFixture.dataSource = self
                self.tableViewFixture.reloadData()
            }
            
            
            
            
        }
    }
 
    
}
extension ViewControllerFixture: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fixture?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCellWithIdentifier("fixtureCell", forIndexPath: indexPath) as! TableViewCellFixture
        let cell = dequeued as TableViewCellFixture
        cell.homeTeam.text = fixture![indexPath.row].homeTeamName
        cell.awayTeam.text = fixture![indexPath.row].awayTeamName
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ss"
        let day: NSDate = dateFormatter.dateFromString(fixture![indexPath.row].date!.stringByReplacingOccurrencesOfString("Z", withString: "", options: .LiteralSearch, range: nil))!
        
        
        cell.dateMatch.text = day.description
        
        if let goalsHomeTeam = fixture![indexPath.row].goalsHomeTeam, goalsAwayTeam = fixture![indexPath.row].goalsAwayTeam  {
            cell.homeGoals.text = goalsHomeTeam.description
            cell.awayGoals.text = goalsAwayTeam.description
        }else{
            cell.homeGoals.text = "-"
            cell.awayGoals.text = "-"
        }
        
        
        
        
        return cell
    }
}