//
//  MiddleCategoriesTableViewController.swift
//  OrderUs
//
//  Created by Muhammadali on 02/06/2017.
//  Copyright © 2017 PRO. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    let rows = 2
    var categories = [Int](repeating: 0, count: 10)
    
    struct Constants {
        static let noSelectedSection = -1
    }
    
    var selectedSection: Int = Constants.noSelectedSection
    
    func selectedChanged(to selected: Int?) {
        if let s = selected {
            if selectedSection != s {
                selectedSection = s
            } else {
                selectedSection = Constants.noSelectedSection
            }
            let indexPath = IndexPath(row: 0, section: s)
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            //            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //                return tableView.rowHeight
        return (selectedSection == indexPath.section) ? tableView.rowHeight : 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header")
        if let categoryCell = cell as? MyTableViewCell {
            categoryCell.category = section + 1
            categoryCell.controller = self
            categoryCell.indexSection = section
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Body", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "Body \(indexPath.section + 1) - \(indexPath.row + 1)"
        }
        return cell
    }
    
}
