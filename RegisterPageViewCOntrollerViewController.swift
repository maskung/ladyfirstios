//
//  RegisterPageViewCOntrollerViewController.swift
//  ladyfirst
//
//  Created by Suphanut Thanyaboon on 12/9/2559 BE.
//  Copyright © 2559 DTKAD. All rights reserved.
//

import UIKit
import WebKit


class RegisterPageViewCOntrollerViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    
    
    var myString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userName = userNameTextField.text;
        let userPassword = userPasswordTextField.text;
        let userConfirmPassword = userConfirmPasswordTextField.text;
        let userEmail = userEmailTextField.text;
        
        
        // CHeck for empty fields
        if ((userName?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)! || (userEmail?.isEmpty)! ) {
            
            
            
            //Display alert message
            displayMyAlertMessage(userMessage: "all fields are required")
            
            
            return;
        }
        
        //displayMyAlertMessage(userMessage:  )
        
        // Check if password match
        if (userPassword != userConfirmPassword) {
            // Display an alert message
            
            displayMyAlertMessage(userMessage: "Password do not match");
            
            return;
        }
        
        
        // Store data
        //UserDefaults.standard.set(userName, forKey: "userName");
        //UserDefaults.standard.set(userPassword, forKey: "userPassword");
        //UserDefaults.standard.set(userEmail, forKey: "userEmail");
        
        //send the register data to server
       
    /*
       var request = URLRequest(url: URL(string: "http://ladyfirst.dtkad.com/mobile/user/register")!)
        request.httpMethod = "POST"
        let postString = "username=\(userName!)&password=\(userPassword!)&email=\(userEmail!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {    // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
   
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
            
            
            do {
                guard let user = try JSONSerialization.jsonObject(with: data, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                print("The todo is: \(user)")
                // the todo object is a dictionary
                
                
                
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            
        
        }
        task.resume()
       */
 
        
        //guard let user_id = user["user_id"] as? Int else {
        //    print("could not get userid as string form JSON")
        //    return
        //}

    
     
        forData() { responseString in
            //self.myString = responseString
            
                self.myString = responseString
           
            
        }
        
        
        //self.fetchData()
        print(myString)
        
        
        

        
        
        
       /*
        let config = URLSessionConfiguration.default  // session configuration
        let session = URLSession(configuration: config)
        let url = URL(string: "http://ladyfirst.dtkad.com/mobile/user/register")
        
        
        
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json.description)
                        self.userid = (json["user_id"] as? Int)!
                        
                        
                    }
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        
        
       */
        
        
       
        //print(userid)
    
        
        
       
        
        var userid = 0
        if (userid == 0) {
            
            self.displayMyAlertMessage(userMessage: "Registration Fail:Duplate User");
            return
        } else {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
        

        
        
        //displayMyAlertMessage(userMessage: "login success");
        
        // Display alert message with comfirmation
        //self.performSegue(withIdentifier: "loginToMain", sender: self)
        ////let myAlert = UIAlertController(title:"Alert",message:"Registration Success", preferredStyle: UIAlertControllerStyle.alert);
        
        
        ////let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default) {
        ////    action in
            //self.dismiss(animated: true,completion:nil);
        ////    self.performSegue(withIdentifier: "loginView", sender: self)
       //// };
        
       //// myAlert.addAction(okAction);
         //self.dismiss(animated: true,completion:nil);
       //// self.performSegue(withIdentifier: "registomain", sender: self)
        
    }
   
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert",message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
     
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
    }
    
    func fetchData() {
        
        let url = NSURL(string: "http://ladyfirst.dtkad.com/mobile/user/register")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
            
            do {
               let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
                
              
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            
            
        }.resume()
        
    }
    
    // the completion closure signature is (String) -> ()
    func forData(completion: @escaping (String) -> ()) {
        
        let userName = userNameTextField.text;
        let userPassword = userPasswordTextField.text;
        let userEmail = userEmailTextField.text;
        
        if let url = URL(string: "http://ladyfirst.dtkad.com/mobile/user/register") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //let postString : String = "uid=59"
            let postString : String = "username=\(userName!)&password=\(userPassword!)&email=\(userEmail!)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                if let data = data, let jsonString = String(data: data, encoding: String.Encoding.utf8), error == nil {
                    completion(jsonString)
                } else {
                    print("error=\(error!.localizedDescription)")
                }
                
                
                
            }
            task.resume()
        }
    }

    

}




