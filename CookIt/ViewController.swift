//
//  ViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 29-05-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var recipes:[Recipe] = []
    var recipeTitle:String = ""
    @IBOutlet weak var tableview: UITableView!

    @IBOutlet weak var MenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Url: String = "http://www.recipepuppy.com/api/"
        let prov: Provider = Provider(url: Url)
        recipes = prov.parseRecipes()
        for i in recipes{
            println(i.getTitle())
        }
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        
        
        if(self.revealViewController() != nil){
            MenuButton.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as! recipeCell
    let url = NSURL(string: recipes[indexPath.row].getThumb())
    let Data = NSData(contentsOfURL: url!)
    let image = UIImage(data: Data!)
    cell.photoRecipe.image = image
    cell.titleRecipe.text = recipes[indexPath.row].getTitle()
    recipeTitle = cell.titleRecipe.text!
    return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "recipeDetail"){
            let indexPath: NSIndexPath = self.tableview.indexPathForSelectedRow()!;
            let destination: RecipeDetailViewController = segue.destinationViewController as! RecipeDetailViewController
            destination.currentTitle = recipes[indexPath.row].getTitle()
            destination.currentImage = recipes[indexPath.row].getThumb()
            destination.currentIngredients = recipes[indexPath.row].getIngredients()
            destination.currentURL = recipes[indexPath.row].getHref()
            
        }
    }

}

