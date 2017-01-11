//
//  LoginTypeController.swift
//  ladyfirst
//
//  Created by Suphanut Thanyaboon on 12/13/2559 BE.
//  Copyright © 2559 DTKAD. All rights reserved.
//

import UIKit

class LoginTypeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginWithName(_ sender: Any) {
    
            
        self.performSegue(withIdentifier: "loginView", sender: self)
        //self.dismiss(animated: true, completion: nil);

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
