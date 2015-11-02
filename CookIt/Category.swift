//
//  Category.swift
//  CookIt
//
//  Created by Alfredo Luco on 01-11-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import Foundation


class Category {
    private var name: String
    private var isSelected: Bool
    
    init(Name: String){
        self.name = Name
        self.isSelected = false
    }
    
    internal func getName() -> String{
        return self.name
    }
    
    internal func getSelected() -> Bool{
        return self.isSelected
    }
    
    internal func setSelected(){
        if(self.isSelected){
            self.isSelected = false
        }else{
            self.isSelected = true
        }
    }
}