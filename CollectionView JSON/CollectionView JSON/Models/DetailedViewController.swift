//
//  DetailedViewController.swift
//  CollectionView JSON
//
//  Created by Prateek Roy on 07/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    var newHeroes : HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        nameLabel.text = newHeroes?.localized_name.capitalized
//        attributeLabel.text = newHeroes?.primary_attr.capitalized
//        attackLabel.text = newHeroes?.attack_type.capitalized
//        legsLabel.text = "\((newHeroes?.legs)!)"
//        
//        let baseURL = "https://api.opendota.com" + (newHeroes?.img)!
//        let urlToPass = URL(string: baseURL)
//        imageView.downloadedFrom(url: urlToPass!)
//        
    }


}
