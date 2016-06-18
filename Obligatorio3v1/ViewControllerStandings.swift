//
//  ViewControllerStandings.swift
//  Obligatorio3v1
//
//  Created by SP07 on 17/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewControllerStandings: UIViewController, UITableViewDelegate {
    
    var standings: Standings?
    var actualGroup:[Team]?
   
    @IBOutlet weak var tableGroup: UITableView!
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
        
        
        APIClientPositions.sharedClient.footballOnCompletion { (standings, error) -> Void in
            
            if let standings = standings {
                self.standings = standings
                self.tableGroup.dataSource = self
                self.tableGroup.delegate = self
                self.tableGroup.reloadData()
            }
            
            
            
            
        }
    }
    func groupForSection (section : Int)->[Team]?{
        switch section{
        case 0:
            return standings?.grupA
        case 1:
            return standings?.grupB
        case 2:
            return standings?.grupC
        case 3:
            return standings?.grupD
        case 4:
            return standings?.grupE
        default:
            return standings?.grupF
      
        }
    }

    



}

extension ViewControllerStandings: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCellWithIdentifier("groupCell", forIndexPath: indexPath) as! TableViewCellStandings
        let cell = dequeued as TableViewCellStandings
        
        actualGroup = groupForSection (indexPath.section)
        cell.points.text = actualGroup![indexPath.row].points?.description
        /*cell.points.text = standings?.grupA[0].![indexPath.row].points?.description
        cell.played.text = standings![indexPath.row].playedGames?.description
        cell.rank.text = standings![indexPath.row].playedGames?.description
        cell.goalDiff.text = standings![indexPath.row].goalsDifference?.description
        cell.flag.image = UIImage(named: standings![indexPath.row].team!)
        */
        return cell
    }
}