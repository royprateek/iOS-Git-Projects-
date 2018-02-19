//
//  AddViewController.swift
//  CourseBook Realm
//
//  Created by Prateek Roy on 17/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var existingCourse : Course?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        name.delegate = self
        email.delegate = self
        
        // Fill view with existingCourse Data
        if let passedCourse = existingCourse{
            name.text = passedCourse.name
            email.text = passedCourse.email
            price.text = passedCourse.price
            
            if let imageNSData = passedCourse.imageNSData as Data?{
                let image = UIImage(data: imageNSData as Data)
                imageView.image = image
            }
        }
        
    }

    
    //MARK: To Save Data In Realm
    @IBAction func saveTapped(_ sender: Any) {
        var newCourse : Course
        
        if existingCourse == nil{
            newCourse = Course()
            
            if let name = name.text{
                newCourse.name = name
            }
            if let price  = price.text{
                newCourse.price = price
            }
            if let email = email.text {
                newCourse.email = email
            }
            if let image = imageView.image{
                if let nsData = UIImageJPEGRepresentation(image, 0.1) as NSData?{
                    newCourse.imageNSData = nsData as NSData?
                }
            }
            
            //SAVING TO REALM
            let realm = try! Realm()
            try! realm.write {
                realm.add(newCourse)
            }
        }else{
            //Update Part
            newCourse = existingCourse!
            
            let realm = try? Realm()
            try? realm?.write {
                if let name = name.text{
                    newCourse.name = name
                }
                if let email = email.text{
                    newCourse.email = email
                }
                if let price = price.text{
                    newCourse.price = price
                }
                if let image = imageView.image{
                    if let nsData = UIImageJPEGRepresentation(image, 0.1) as NSData?{
                        newCourse.imageNSData = nsData as NSData?
                    }
                }
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    //Mark: Fetch Image From Gallery/Photos
    @IBAction func addImageTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    //MARK: Setting And Dismiss ImagePicker After Selection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = ima
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Keyboard Dissmiss On-Screen Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //MARK: Keyboard Dismiss On Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        email.resignFirstResponder()
        
        return false
    }
}
