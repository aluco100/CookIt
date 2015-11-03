//
//  RecipeDetailViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 24-10-15.
//  Copyright (c) 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeIngredients: UITextView!
    var currentTitle: String = ""
    var currentImage: String = ""
    var currentIngredients: String = ""
    var currentURL: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titulo
        recipeTitle.text = currentTitle
        
        //imagen
        let url: NSURL = NSURL(string: currentImage)!
        let Data: NSData = NSData(contentsOfURL: url)!
        let image: UIImage = UIImage(data: Data)!
        recipeImage.image = image
        
        //ingredientes
        recipeIngredients.text = currentIngredients
        
        // Do any additional setup after loading the view.
    }

    @IBAction func openLink(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: currentURL)!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "webSegue"){
            let destination = segue.destinationViewController as? WebDetailViewController
            destination?.url = currentURL
        }
    }
    

}
