//
//  POIsTableViewController.swift
//  grail-project
//
//  Created by Uptiie on 7/17/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var poiTableViewController: UITableView!
    
    var pois: [POI] = []
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else { return UITableViewCell() }
        
        let POI = pois[indexPath.row]
        cell.POI = POI
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIDetailSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
            let POIDetailVC = segue.destination as? POIDetailViewController
            POIDetailViewController.POI = POI[IndexPath.row]
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func POIWadCreated(_ POI: POI) {
        pois.append(POI)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
