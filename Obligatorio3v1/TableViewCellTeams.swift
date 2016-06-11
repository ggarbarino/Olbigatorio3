//
//  TableViewCellTeams.swift
//  Obligatorio3v1
//
//  Created by SP07 on 10/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//
import UIKit
import Foundation

class TableViewCellTeam: UITableViewCell{
    
    @IBOutlet weak var teamFlag: UIWebView!
    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
