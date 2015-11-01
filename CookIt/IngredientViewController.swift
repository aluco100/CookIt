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
    var popOver: UIPopoverController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var flag: Bool = false
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone){
            if(segue.identifier == "addpopover"){
                let popOverViewController = segue.destinationViewController as? AddViewController
                popOverViewController!.modalPresentationStyle = UIModalPresentationStyle.Popover
                popOverViewController!.popoverPresentationController?.delegate = self
                
                let candidato = popOverViewController?.ingrediente_nuevo
                
                for i in Ingredients{
                    if(i.getName() == candidato?.getName()){
                        flag = true
                    }
                }
                
                if(flag){
                    Ingredients.append(candidato!)
                    
                }
            }

        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ingredients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientList", forIndexPath: indexPath)
        cell.textLabel?.text = Ingredients[indexPath.row].getName()
        table.reloadData()
        return cell
    }


}
