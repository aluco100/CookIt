//
//  MenuViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 29-10-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var Ingredients: String = ""
    var Categories: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var identifier: String = ""
        
        switch(indexPath.row){
            case 0:
                identifier = "recetas"
                break;
            case 1:
                identifier = "ingredientes"
                break;
            case 2:
                identifier = "categorias"
                break;
            default: break;
        }
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        return cell
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
        override func applicationFinishedRestoringState() {
        
    }
    
    @IBAction func catchElements(segue: UIStoryboardSegue){
        print(Ingredients)
        
    }
    

}
