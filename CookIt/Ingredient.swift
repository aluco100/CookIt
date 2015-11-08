//
//  Ingredient.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import Foundation

class Ingredient: NSObject,NSCoding {
    private var Name: String
    private var Category: String
    
    init(name: String, category: String){
        self.Name = name
        self.Category = category
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObjectForKey("Ingredient_name") as? String
        let categoria = aDecoder.decodeObjectForKey("Ingredient_category") as? String
        self.init(name: nombre!,category: categoria!)
    }
    
    //funtions getter
    internal func getName()->String{
        return self.Name
    }
    
    internal func getCategory()->String{
        return self.Category
    }
    
    //functions setter
    
    internal func setName(newName: String){
        self.Name = newName
    }
    
    internal func setCategory(newCategory: String){
        self.Category = newCategory
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.Name, forKey: "Ingredient_name")
        aCoder.encodeObject(self.Category, forKey: "Ingredient_category")
    }
    
    
    
}