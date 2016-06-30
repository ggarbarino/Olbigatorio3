//
//  ViewController.swift
//  Obligatorio3v1
//
//  Created by SP07 on 9/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import UIKit
import AlamofireImage
import GoogleMobileAds

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var bannerView: GADBannerView!
    var team: [Team]?
    @IBOutlet weak var emptyIndicatorTeam: UIActivityIndicatorView!
    var teamName: String? = ""
    var teamFixtrue: String? = ""
    @IBOutlet weak var teamsTable: UITableView!
    override func viewDidLoad() {
        self.title = "Teams"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        emptyIndicatorTeam.startAnimating()
        APIClient.sharedClient.footballOnCompletion { (team, error) -> Void in
            
            if let team = team {
                self.team = team
                self.teamsTable.dataSource = self
                self.teamsTable.delegate = self
                self.teamsTable.reloadData()
                self.emptyIndicatorTeam.stopAnimating()
            }
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        teamFixtrue = team![indexPath.row].teamFixture
        teamName = team![indexPath.row].name
        self.performSegueWithIdentifier("goToTeamFixture", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier=="goToTeamFixture"){
            let teamFixture = segue.destinationViewController as! ViewControllerTeamFixture
            teamFixture.urlFixture = teamFixtrue
            teamFixture.teamName = teamName
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (team?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCellWithIdentifier("teamCell", forIndexPath: indexPath) as! TableViewCellTeam
        let cell = dequeued as TableViewCellTeam
        cell.name.text = team![indexPath.row].name
        cell.flag.image = UIImage(named: team![indexPath.row].name!)

        return cell
    }
}