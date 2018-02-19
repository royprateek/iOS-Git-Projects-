//
//  ViewController.swift
//  ACoffeeApp
//
//  Created by Prateek Roy on 27/12/17.
//  Copyright © 2017 Prateek Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pricePay: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Textfield should have a round rect
        inputText.layer.cornerRadius = 15.0
    }

    @IBAction func priceTapped(_ sender: Any) {
        if inputText.text == "" {
            errorLabel.text = "Enter Value In Box"
            errorLabel.textColor = UIColor .red
            inputText .resignFirstResponder()
        }else{
            let input = Double(inputText.text!)
            pricePay.text = "\(input! * 5) $"
            inputText .resignFirstResponder()
            errorLabel.text = nil
            
        }
    }
    
    //MARK: Keyboard Dismiss On_Screen Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

