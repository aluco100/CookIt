//
//  IngredientViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class IngredientViewController: UITableViewController, UIPopoverControllerDelegate {
    //outlets
    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet var table: UITableView!
    
    //variables
    var Ingredients: [Ingredient] = []
    var popOver: UIPopoverController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addIngredient(sender: AnyObject) {
        let storyboard = self.storyboard
        let contentVC: UIViewController = (storyboard?.instantiateViewControllerWithIdentifier("AddViewController"))!
        self.popOver = UIPopoverController.init(contentViewController: contentVC)
        self.popOver!.delegate = self
        self.popOver?.presentPopoverFromRect(sender.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        //addCategory()
    }

   /* func addCategory() {
        
        let popoverContent = (self.storyboard?.instantiateViewControllerWithIdentifier("AddViewController"))! as UIViewController
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSizeMake(500,600)
        popover!.delegate = self
        popover!.sourceView = self.view
        popover!.sourceRect = CGRectMake(100,100,0,0)
        
        self.presentViewController(nav, animated: true, completion: nil)
        
    }*/
}
