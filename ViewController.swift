//
//  ViewController.swift
//  ladyfirst
//
//  Created by Suphanut Thanyaboon on 11/14/2559 BE.
//  Copyright © 2559 DTKAD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loggoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize();
        
        self.performSegue(withIdentifier: "loginTypeView", sender: self)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        
        if (!isUserLoggedIn) {
        
            self.performSegue(withIdentifier: "loginTypeView", sender: self)
            
        }
    }

}

