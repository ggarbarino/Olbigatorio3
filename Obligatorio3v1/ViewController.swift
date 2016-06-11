//
//  ViewController.swift
//  Obligatorio3v1
//
//  Created by SP07 on 9/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {
    var team: [Team]?
    
    @IBOutlet weak var teamsTable: UITableView!
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
        
        
        APIClient.sharedClient.footballOnCompletion { (team, error) -> Void in
            
            if let team = team {
                self.team = team
                self.teamsTable.dataSource = self
                self.teamsTable.reloadData()
            }
        
        
        
        
        }
    }
    func obtainFlagHtml (URL : String) ->String{
        return "<img height='50px' width='100px' src=\"\(URL)\" />"
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
        
        let URL = NSURL(string: team![indexPath.row].URLflag!)
        let requestObj = obtainFlagHtml((URL?.absoluteString)!)
        
        cell.teamFlag.loadHTMLString(requestObj, baseURL: nil)
        return cell
    }
}