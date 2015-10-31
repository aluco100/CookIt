//
//  Provider.swift
//  CookIt
//
//  Created by Alfredo Luco on 24-10-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import Foundation
class Provider {
    private var URL: String
    
    init(url:String){
        self.URL = url
    }
    
    internal func getRecipes()->NSDictionary{
        let Data = self.getJSON()
        return self.parseJSON(Data)
    }
    
    private func getJSON() -> NSData{
        return NSData(contentsOfURL: NSURL(string: self.URL)!)!
    }
    
    private func parseJSON(inputData: NSData) -> NSDictionary{
        let boardsDictionary: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        
        return boardsDictionary
    }
    
    internal func parseRecipes()->[Recipe]{
        var arr:[Recipe] = []
        let Recipes = self.getRecipes()
        let Data:NSArray = Recipes["results"] as! NSArray
        for i in Data{
            let aux:NSDictionary = (i as? NSDictionary)!
            let auxtitle: String = aux["title"] as! String
            let auxhref: String = aux["href"] as! String
            let auxthumb: String = aux["thumbnail"] as! String
            let auxingredients: String = aux["ingredients"] as! String
            
            let newRecipe: Recipe = Recipe(title: auxtitle, href: auxhref, thumb: auxthumb, ingredients: auxingredients)
            arr.append(newRecipe)
        }
        return arr
    }
}