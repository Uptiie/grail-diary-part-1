//
//  POIsTableViewController.swift
//  grail-project
//
//  Created by Uptiie on 7/17/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var poiTableView: UITableView!

    var pois: [POI] = []
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowDetailSegue" {
            if let showDetailVC = segue.destination as? POIDetailViewController,
                let indexPath = poiTableView.indexPathForSelectedRow {
                showDetailVC.poi = pois[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasCreated(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        poiTableView.reloadData()
        
}
}
