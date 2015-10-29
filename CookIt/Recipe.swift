//
//  Recipe.swift
//  CookIt
//
//  Created by Alfredo Luco on 24-10-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import Foundation
class Recipe {
    private var Title: String
    private var Href: String
    private var Thumb: String
    private var Ingredients: String
    
    init(title: String, href: String, thumb: String, ingredients: String){
        self.Title = title
        self.Href = href
        self.Thumb = thumb
        self.Ingredients = ingredients
    }
    
    //getter
    
    internal func getTitle()->String{
        return self.Title
    }
    
    internal func getHref()->String{
        return self.Href
    }
    
    internal func getThumb()->String{
        return self.Thumb
    }
    
    internal func getIngredients()->String{
        return self.Ingredients
    }
    

}