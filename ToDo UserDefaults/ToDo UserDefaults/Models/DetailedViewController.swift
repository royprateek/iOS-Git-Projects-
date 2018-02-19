//
//  DetailedViewController.swift
//  ToDo UserDefaults
//
//  Created by Prateek Roy on 07/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var textFieldAdded: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textFieldAdded.delegate = self
    }
    
    //MARK: Add Button Functions
    @IBAction func addPressed(_ sender: Any) {
        if (textFieldAdded.text != nil) && textFieldAdded.text != ""{
            todoList?.append(textFieldAdded.text!)
            textFieldAdded.text = ""
            textFieldAdded.placeholder = "You Can Add More"
            textFieldAdded.resignFirstResponder()
        }
    }
    
    //Dismiss Keyboard On-Screen Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Dismiss Keyboard On Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldAdded.resignFirstResponder()
        return false
    }
}
