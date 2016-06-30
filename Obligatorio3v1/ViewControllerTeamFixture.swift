//
//  ViewControllerTeamFixture.swift
//  Obligatorio3v1
//
//  Created by SP07 on 15/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import UIKit
import DateTools
import GoogleMobileAds

class ViewControllerTeamFixture: UIViewController {
    
    var fixture: [Fixture]?
    var urlFixture: String?
    var teamName: String?
    var matchDay: String = ""
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableViewTeamFixture: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
        self.title = teamName! + " Matches"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        APIClientFixture.sharedClient.fixtureOnCompletion(urlFixture) { (fixture, error) -> Void in
            
            if let fixture = fixture {
                self.fixture = fixture
                self.tableViewTeamFixture.dataSource = self
                self.tableViewTeamFixture.reloadData()
            }
        }
    }
}

extension ViewControllerTeamFixture: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fixture?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCellWithIdentifier("fixtureCell", forIndexPath: indexPath) as! TableViewCellTeamFixture
        let cell = dequeued as TableViewCellTeamFixture
        cell.homeTeam.text = fixture![indexPath.row].homeTeamName
        cell.awayTeam.text = fixture![indexPath.row].awayTeamName
        
        
        
        if let goalsHomeTeam = fixture![indexPath.row].goalsHomeTeam, goalsAwayTeam = fixture![indexPath.row].goalsAwayTeam  {
            cell.homeGoals.text = goalsHomeTeam.description
            cell.awayGoals.text = goalsAwayTeam.description
        }else{
            cell.homeGoals.text = "-"
            cell.awayGoals.text = "-"
        }
        cell.homeFlag.image = UIImage(named: fixture![indexPath.row].homeTeamName!)
        cell.awayFlag.image = UIImage(named: fixture![indexPath.row].awayTeamName!)
        let matchStatus: String = fixture![indexPath.row].status!
        if matchStatus == "TIMED"{
            self.matchDay = (fixture![indexPath.row].date?.formattedDateWithFormat("EEE dd MMMM hh:mm a"))!
        }
        else{
            self.matchDay = (fixture![indexPath.row].date?.formattedDateWithFormat("EEE dd MMMM"))!
        }
        cell.date.text = matchDay
        
        
        return cell
    }
}