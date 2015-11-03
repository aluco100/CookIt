//
//  WebDetailViewController.swift
//  CookIt
//
//  Created by Alfredo Luco on 03-11-15.
//  Copyright © 2015 Alfredo Luco. All rights reserved.
//

import UIKit

class WebDetailViewController: UIViewController {
    
    var url: String = ""
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
        if(webView.loading){
            loading.hidden = false
            loading.startAnimating()
        }else{
            loading.hidden = true
            loading.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
