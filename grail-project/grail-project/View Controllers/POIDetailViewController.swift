//
//  POIDetailViewController.swift
//  grail-project
//
//  Created by Uptiie on 7/17/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UILabel!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard let poi = poi else { return }
        
        locationName.text = poi.location
        CountryLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText += "∙ \(clue)\n"
        }
        
        cluesListTextView.text = clueText
    }
}
