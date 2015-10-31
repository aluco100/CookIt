//
//  Ingredient.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import Foundation

class Ingredient {
    private var Name: String
    private var Category: String
    
    init(name: String, category: String){
        self.Name = name
        self.Category = category
    }
    
    //funtions getter
    internal func getName()->String{
        return self.Name
    }
    
    internal func getCategory()->String{
        return self.Category
    }
}