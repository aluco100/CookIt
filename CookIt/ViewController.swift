//
//  ViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 29-05-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //variables
    var recipes:[Recipe] = []
    var recipeTitle:String = ""
    var Url: String = "http://www.recipepuppy.com/api/"
    
    //outlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var MenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        let userdefaults = NSUserDefaults.standardUserDefaults()
        if(userdefaults.valueForKey("Ingredients") != nil){
            let ingr: String = userdefaults.objectForKey("Ingredients") as! String
            self.Url = "http://www.recipepuppy.com/api/?i=\(ingr)"
            print(ingr)
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),{
            let prov: Provider = Provider(url: self.Url)
            self.recipes = prov.parseRecipes()
            
            dispatch_sync(dispatch_get_main_queue(), {
                self.tableview.reloadData()
            })
            })
        if(recipes.count == 0){
            loading.hidden = false
            loading.startAnimating()
            
        }else{
            loading.hidden = true
            loading.stopAnimating()
        }
        
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
        if(recipes.count == 0){
            loading.hidden = false
            loading.startAnimating()
            
        }else{
            loading.hidden = true
            loading.stopAnimating()
        }

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
            let indexPath: NSIndexPath = self.tableview.indexPathForSelectedRow!;
            let destination: RecipeDetailViewController = segue.destinationViewController as! RecipeDetailViewController
            destination.currentTitle = recipes[indexPath.row].getTitle()
            destination.currentImage = recipes[indexPath.row].getThumb()
            destination.currentIngredients = recipes[indexPath.row].getIngredients()
            destination.currentURL = recipes[indexPath.row].getHref()
            
        }
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }
    override func applicationFinishedRestoringState() {
        
    }

}

