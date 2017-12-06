//
//  ViewController.swift
//  ContactsAppProject
//
//  Created by Emmanuelle TERMEAU on 12/6/17.
//  Copyright © 2017 Emmanuelle TERMEAU. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    var contactManager = ContactManager()
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwdField: UITextField!
    
    
    @IBAction func submitButton(_ sender: Any) {
//        if self.contactManager != nil {
            self.contactManager.getDB()
//        }

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactManager.loadDB()
        
        self.view.backgroundColor = UIColor.lightGray
        self.contactManager.getDB()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func checkLogin(user: String, psswd : String) {
        
    }
    
}

