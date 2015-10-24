//
//  recipeCell.swift
//  CookIt
//
//  Created by Alfredo Luco on 24-10-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class recipeCell: UITableViewCell {

    @IBOutlet weak var photoRecipe: UIImageView!
    @IBOutlet weak var titleRecipe: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
