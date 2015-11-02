//
//  CategoryCell.swift
//  CookIt
//
//  Created by Alfredo Luco on 01-11-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var seleccion: UISwitch!
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
