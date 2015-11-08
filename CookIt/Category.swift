//
//  Category.swift
//  CookIt
//
//  Created by Alfredo Luco on 01-11-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import Foundation


class Category: NSObject, NSCoding {
    private var name: String
    private var isSelected: Bool
    
    init(Name: String){
        self.name = Name
        self.isSelected = false
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name_category = aDecoder.decodeObjectForKey("Category_name") as? String
        let state = aDecoder.decodeObjectForKey("Category_state") as? Bool
        self.init(Name: name_category!)
        self.setSelected(state!)
    }
    
    internal func getName() -> String{
        return self.name
    }
    
    internal func getSelected() -> Bool{
        return self.isSelected
    }
    
    internal func setSelected(state: Bool){
        self.isSelected = state
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "Category_name")
        aCoder.encodeObject(self.isSelected, forKey: "Category_state")
    }
}