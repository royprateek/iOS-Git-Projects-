//
//  DetailedViewController.swift
//  Custom Cell With Swift
//
//  Created by Prateek Roy on 04/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    
    var newDetail:Details?
    
    //var captureWebsite = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //websiteLabel.text = "\(captureWebsite)"
        
        websiteLabel.text = newDetail?.website
        yearLabel.text = newDetail?.year
        companyLogo.image = newDetail?.image
    }


}
