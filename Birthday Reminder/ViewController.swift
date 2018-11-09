//
//  ViewController.swift
//  Birthday Reminder
//
//  Created by Omer  on 8.11.2018.
//  Copyright © 2018 Omer Varoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameInput.text, forKey: "name")
        UserDefaults.standard.set(birthdayInput.text, forKey: "birthday")
        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameInput.text!)"
        birthdayLabel.text = "Birthday: \(birthdayInput.text!)"
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
       
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.synchronize()
            birthdayLabel.text = "Birthday: "
        }
        
    }
    
}

