//
//  AddViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    var popover: UIPopoverController? = nil
    var navC: UINavigationController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        let native:IngredientViewController = IngredientViewController()
        navC = UINavigationController(rootViewController: native)
        popover = UIPopoverController(contentViewController: navC!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButton(sender: AnyObject) {
        popover?.dismissPopoverAnimated(true)
        self.popover = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
