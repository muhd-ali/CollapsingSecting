//
//  MiddleCategoriesTableViewCell.swift
//  OrderUs
//
//  Created by Muhammadali on 02/06/2017.
//  Copyright © 2017 PRO. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var labelOutlet: UILabel!
    var controller: MyTableViewController?
    var indexSection: Int?
    
    var categoryName = ""
    var category: Int? {
        didSet {
            if category != nil {
                categoryName = "Header \(category!)"
                addGestureRecognizer()
                updateUI()
            }
        }
    }
    
    func addGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        addGestureRecognizer(recognizer)
    }
    
    func handleTapGesture(recognizer: UITapGestureRecognizer) {
        controller?.selectedChanged(to: indexSection)
    }
    
    func updateUI() {
        labelOutlet.text = categoryName
    }

}
