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
    @IBOutlet weak var tableview: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Url: String = "http://www.recipepuppy.com/api/"
        let prov: Provider = Provider(url: Url)
        recipes = prov.parseRecipes()
        for i in recipes{
            println(i.getTitle())
        }
        tableview.delegate = self
        tableview.separatorStyle = UITableViewCellSeparatorStyle.None
        tableview.reloadData()
        
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
    let cell = tableview.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as! recipeCell
    let entry = recipes[indexPath.row]
    let image = UIImage(named: recipes[indexPath.row].getThumb())
    cell.photoRecipe.image = image
    cell.titleRecipe.text = recipes[indexPath.row].getTitle()
    return cell
    }


}

