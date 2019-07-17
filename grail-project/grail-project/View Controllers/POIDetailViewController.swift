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
    
    var POI: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard let POI = POI else { return }
        
        locationName.text = POI.location
        CountryLabel.text = POI.country
        var clueText = ""
        for clue in POI.clues {
            clueText += ". \(clue)\n"
        }
        
        cluesListTextView.text = clueText
    }
}
