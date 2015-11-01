//
//  CategoryViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 01-11-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var MenuButton: UIButton!
    @IBOutlet weak var table: UITableView!
    
    var categorias : [String] = ["Dishes", "Salads", "Desserts", "Snacks", "Omelet", "Drinks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.reloadData()
        
        if(self.revealViewController() != nil){
            MenuButton.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! CategoryCell
        cell.titulo.text = categorias[indexPath.row] 
        
        return cell
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! CategoryCell
        if(cell.icon.text == "❌"){
            cell.icon.text = "✔️"
        }else{
            cell.icon.text = "❌"
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
