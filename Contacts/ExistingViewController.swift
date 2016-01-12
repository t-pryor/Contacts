//
//  ExistingViewController.swift
//  Contacts
//
//  Created by Tim Pryor on 2016-01-12.
//  Copyright © 2016 Tim Pryor. All rights reserved.
//

import UIKit

class ExistingViewController: UIViewController {
    
    @IBOutlet var fullNameTextField: UITextField!

    
    var currentContact: Contact = Contact(contactName: "")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTextField.text = currentContact.name;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
