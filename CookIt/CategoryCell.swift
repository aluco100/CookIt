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
    
    @IBAction func setStateCategory(sender: AnyObject) {
        let masterCategories = loadCategories()
        for i in masterCategories{
            if(i.getName() == titulo.text){
                i.setSelected(seleccion.on)
                print("cambio")
            }
        }
        saveCategories(masterCategories)
    }
    
    func saveCategories(sender: [Category]){
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(sender)
        defaults.setObject(data, forKey: "Categories_native")
    }
    
    func loadCategories()->[Category]{
        let defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let data: NSData = (defaults.objectForKey("Categories_native") as? NSData)!
        return NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Category]
    }

}
