//
//  AddViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 31-10-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var Ingrediente: UITextField!
    @IBOutlet weak var Categoria: UITextField!
    

    var popover: UIPopoverController? = nil
    var navC: UINavigationController? = nil
    var ingrediente_nuevo: Ingredient = Ingredient(name: "", category: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
            let native:IngredientViewController = IngredientViewController()
            navC = UINavigationController(rootViewController: native)
            popover = UIPopoverController(contentViewController: navC!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButton(sender: AnyObject) {
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
            popover?.dismissPopoverAnimated(true)
            self.popover = nil
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func Agregar(sender: AnyObject) {
        let name: String = Ingrediente.text!
        let category: String = Categoria.text!
        
        ingrediente_nuevo.setName(name)
        ingrediente_nuevo.setCategory(category)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
        
    

}
