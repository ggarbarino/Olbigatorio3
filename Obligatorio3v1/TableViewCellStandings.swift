//
//  TableViewCellStandings.swift
//  Obligatorio3v1
//
//  Created by SP07 on 17/6/16.
//  Copyright © 2016 SP07. All rights reserved.
//
import UIKit
import Foundation

class TableViewCellStandings: UITableViewCell{
    

    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var played: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var goalDiff: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}