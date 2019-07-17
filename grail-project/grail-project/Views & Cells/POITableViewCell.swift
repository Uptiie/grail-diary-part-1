//
//  POITableViewCell.swift
//  grail-project
//
//  Created by Uptiie on 7/17/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueCountLabel: UILabel!
    
    
    var POI: POI? {
    didSet {
        updateViews()
    }
}

private func updateViews() {
    guard let POI = POI else { return }
    
    locationLabel.text = POI.location
    countryLabel.text = POI.country
    clueCountLabel.text = "\(POI.clues.count) clues"
        
    }
    
}
