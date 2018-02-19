//
//  Course.swift
//  
//
//  Created by Prateek Roy on 17/02/18.
//

import Foundation
import RealmSwift

//MARK: Model Definition For Realm Database
class Course: Object {
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var price = ""
    
    @objc dynamic var imageNSData:NSData?
}
