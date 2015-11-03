//
//  IngredientViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class IngredientViewController: UITableViewController, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate {
    //outlets
    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet var table: UITableView!
    
    //variables
    var Ingredients: [Ingredient] = []
    var aux: Ingredient = Ingredient(name: "", category: "")
    var popOver: UIPopoverController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.reloadData()
        table.allowsMultipleSelection = false
        
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

    @IBAction func goBack(segue: UIStoryboardSegue){
        print(aux.getName())
        Ingredients.append(aux)
        table.reloadData()
    }

}
