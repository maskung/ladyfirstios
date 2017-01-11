//
//  LoginViewController.swift
//  ladyfirst
//
//  Created by Suphanut Thanyaboon on 12/15/2559 BE.
//  Copyright © 2559 DTKAD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    var logged_in : String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        
        
        //check validate data
        // CHeck for empty fields
        if ((userName?.isEmpty)! || (userPassword?.isEmpty)!) {
            
            
            
            //Display alert message
            displayMyAlertMessage(userMessage: "all fields are required")
            
            
            return;
        }
    
        
        
        //send to server authen
        
        //let todosEndpoint: String = "http://ladyfirst.dtkad.com/mobile/user/login"
        var request = URLRequest(url: URL(string: "http://ladyfirst.dtkad.com/mobile/user/login")!)
        
        request.httpMethod = "POST"
        let postString = "username=\(userName!)&password=\(userPassword!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            //let responseString = String(data: data, encoding: .utf8)
            //print("responseString = \(responseString)")
            
            do {
                guard let user = try JSONSerialization.jsonObject(with: data, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }

                //print("The todo is: \(user)")
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let login = user["login"] as? String else {
                    print("could not get login as string form JSON")
                    return
                }
                
                print(login)
        
                //self.logged_in  = login
                
                if (login == "1") {
                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()
                    
                    
                } else {
                    // pop up login error message
                    self.displayMyAlertMessage(userMessage: "Username or Password error")
                    
                    
                }
               
                
               
            
                
            } catch let error {
                print(error.localizedDescription)
            }

            
            
        }
        task.resume()
        
       
        /*print(logged_in!)
        
        if (self.logged_in == "1") {
            // login is success
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            //self.dismiss(animated: true, completion: nil);
            self.performSegue(withIdentifier: "loginToMain", sender: self)
            
        } else {
            // pop up login error message
            self.displayMyAlertMessage(userMessage: "Username or Password error")
            
        }
         */
        
         // login success go to main page
        self.performSegue(withIdentifier: "loginToMain", sender: self)
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert",message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
    }
    

}

