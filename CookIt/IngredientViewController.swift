//
//  IngredientViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class IngredientViewController: UITableViewController, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate{
    
    //outlets
    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet var table: UITableView!
    
    //variables
    var Ingredients: [Ingredient] = []
    var aux: Ingredient = Ingredient(name: "", category: "")
    var popOver: UIPopoverController? = nil
    var userdefault = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.reloadData()
        table.allowsMultipleSelection = false
        
        userdefault.setObject(parseIngredients(), forKey: "Ingredients")
        if(userdefault.valueForKey("Ingredients_native") != nil){
            let Ingr_Native = userdefault.objectForKey("Ingredients_native") as? NSData
            Ingredients = NSKeyedUnarchiver.unarchiveObjectWithData(Ingr_Native!)! as! [Ingredient]
            
        }
        userdefault.synchronize()
        
        if(self.revealViewController() != nil){
            MenuButton.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ingredients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientsList", forIndexPath: indexPath)
        cell.textLabel?.text = Ingredients[indexPath.row].getName()
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            Ingredients.removeAtIndex(indexPath.row)
            table.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "IngredientsUnwind"){
            let menu = segue.destinationViewController as? MenuViewController
            menu?.Ingredients = parseIngredients()
        }
    }

    @IBAction func goBack(segue: UIStoryboardSegue){
        print(aux.getName())
        Ingredients.append(aux)
        userdefault.setObject(parseIngredients(), forKey: "Ingredients")
        let mutable = NSMutableArray(array: Ingredients)
        let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(mutable)
        userdefault.setObject(data, forKey: "Ingredients_native")
        userdefault.synchronize()
        table.reloadData()
    }
    
    
    func parseIngredients()-> String{
        var commit: String = ""
        for i in Ingredients{
            if(i.getName() != Ingredients.last?.getName()){
                commit += i.getName()+","
            }else{
                commit += i.getName()
            }
        }
        return commit
    }
    

}
