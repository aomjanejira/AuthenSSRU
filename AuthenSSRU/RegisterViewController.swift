//
//  RegisterViewController.swift
//  AuthenSSRU
//
//  Created by Student18 on 20/3/2562 BE.
//  Copyright © 2562 janejira. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //  My Outlet
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //  End Outlet
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }  //Main Method
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        print("You Click Upload")
        
        let name = nameTextField.text!
        let user = userTextField.text!
        let password = passwordTextField.text!
        
        
        print("name = \(name)")
        print("user=\(user)")
        print("password=\(password)")
        
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
            myAlert(titleString: "Have Space", messageString: "Plase Fill All Blank")
        }   else{
            uploadData(name: name, user: user, password: password)
        }
        
        
    }   // upload Button
    
    func myAlert(titleString: String,messageString: String) -> Void {
        
        print("title =\(titleString), message = \(messageString)")
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
        
        
    } //myAlert
    
    func uploadData(name: String, user: String, password: String) -> Void {
        
        let urlString: String = "https://www.androidthai.in.th/snru/addDataAom.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        
        
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if error != nil {
                print("Error")
            } else {
                
                if let testData = data {
                    
                    let canReadData = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canRead ==>\(String(describing: canReadData))")
                }
                
                
            }   //if1
            
            
        } // end Task
        task.resume()
        
        
        
    }
    

    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        print("You Click Back")
        performSegue(withIdentifier: "BackMain", sender: self)
        
    }
    
    
}  //Main Class
