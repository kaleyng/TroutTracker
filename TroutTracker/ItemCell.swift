//
//  ItemCell.swift
//  TroutTracker
//
//  Created by Kaley Groskreutz on 7/19/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.adjustsFontForContentSizeCategory = true
        locationLabel.adjustsFontForContentSizeCategory = true
        dateLabel.adjustsFontForContentSizeCategory = true
    }
}
