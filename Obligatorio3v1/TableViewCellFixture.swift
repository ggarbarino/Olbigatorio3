//
//  TableViewCellFixture.swift
//  Obligatorio3v1
//
//  Created by SP07 on 10/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//
import UIKit
import Foundation

class TableViewCellFixture: UITableViewCell{
    
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var homeGoals: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var awayGoals: UILabel!
    @IBOutlet weak var dateMatch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}