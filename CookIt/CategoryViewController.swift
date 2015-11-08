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
    
    var categorias : [Category] = [Category(Name: "Dishes"), Category(Name: "Salads"), Category(Name: "Desserts"), Category(Name: "Snacks"), Category(Name: "Omelet"), Category(Name: "Drinks")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.reloadData()
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if(defaults.objectForKey("Categories_native") != nil){
            let data: NSData = (defaults.objectForKey("Categories_native") as? NSData)!
            categorias = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Category]
        }else{
            saveCategories()
        }
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
        cell.selectionStyle = .None
        cell.titulo.text = categorias[indexPath.row].getName()
        cell.seleccion.setOn(categorias[indexPath.row].getSelected(), animated: false)
        return cell
    }
    
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }
    override func applicationFinishedRestoringState() {
        
    }
    
    func saveCategories(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(categorias)
        defaults.setObject(data, forKey: "Categories_native")
        defaults.synchronize()
    }

}
