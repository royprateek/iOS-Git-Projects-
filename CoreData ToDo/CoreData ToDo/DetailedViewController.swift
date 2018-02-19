//
//  DetailedViewController.swift
//  CoreData ToDo
//
//  Created by Prateek Roy on 10/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputText.delegate = self
    }

    @IBAction func savePressed(_ sender: UIButton) {
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        let task = Task(context: context)
        
        if let name = inputText.text{
            task.name = name
        }
        guest.saveContext()
        
        inputText.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Dismiss Keyboard On Return Press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputText.resignFirstResponder()
        return false
    }
    
    //MARK: Dismiss Keyboard On-Screen Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
