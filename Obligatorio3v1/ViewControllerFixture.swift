//
//  ViewControllerFixture.swift
//  Obligatorio3v1
//
//  Created by SP07 on 10/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//


import UIKit
import DateTools


class ViewControllerFixture: UIViewController{
    var fixture: [Fixture]?
    var matchDay: String = ""
    @IBOutlet weak var tableViewFixture: UITableView!
    @IBOutlet weak var emptyActivity: UIActivityIndicatorView!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        let myTimer = NSTimer(timeInterval: 60.0, target: self, selector: Selector("refresh"), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(myTimer, forMode: NSDefaultRunLoopMode)
        super.viewDidLoad()
        self.title = "Fixture"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func refresh() {
        emptyActivity.startAnimating()
        APIClientFixture.sharedClient.fixtureOnCompletion("global") { (fixture, error) -> Void in
            
            if let fixture = fixture {
                self.fixture = fixture
                self.tableViewFixture.dataSource = self
                self.tableViewFixture.reloadData()
                self.emptyActivity.stopAnimating()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        refresh()

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
        let matchStatus: String = fixture![indexPath.row].status!
        if matchStatus == "TIMED"{
           self.matchDay = (fixture![indexPath.row].date?.formattedDateWithFormat("EEE dd MMMM hh:mm a"))!
        }
        else{
            self.matchDay = (fixture![indexPath.row].date?.formattedDateWithFormat("EEE dd MMMM"))!
        }
        cell.dateMatch.text = matchDay
        
        if let goalsHomeTeam = fixture![indexPath.row].goalsHomeTeam, goalsAwayTeam = fixture![indexPath.row].goalsAwayTeam  {
            cell.homeGoals.text = goalsHomeTeam.description
            cell.awayGoals.text = goalsAwayTeam.description
        }else{
            cell.homeGoals.text = "-"
            cell.awayGoals.text = "-"
        }
        cell.homeFlag.image = UIImage(named: fixture![indexPath.row].homeTeamName!)
        cell.awayFlag.image = UIImage(named: fixture![indexPath.row].awayTeamName!)
        
        return cell
    }
}