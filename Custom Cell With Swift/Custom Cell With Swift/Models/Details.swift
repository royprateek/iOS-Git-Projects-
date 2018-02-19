//
//  Details.swift
//  Custom Cell With Swift
//
//  Created by Prateek Roy on 05/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

//MARK: Helper Class
class Details {
    var website : String
    var year : String
    var image : UIImage
    
    init(website : String , year : String) {
        self.website = website
        self.year = year
        self.image = UIImage(named: self.website)!
    }
    
}
