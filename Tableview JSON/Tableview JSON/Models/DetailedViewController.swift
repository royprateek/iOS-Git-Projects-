//
//  DetailedViewController.swift
//  Tableview JSON
//
//  Created by Prateek Roy on 05/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

//Downloading Image Extension From stack
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class DetailedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attacksLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    var newHeroes : HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = newHeroes?.localized_name
        attributeLabel.text = newHeroes?.primary_attr
        attacksLabel.text = newHeroes?.attack_type
        legsLabel.text = "\((newHeroes?.legs)!)"
        
        let baseURL = "https://api.opendota.com" + (newHeroes?.img)!
        let urlToPass = URL(string: baseURL)
        imageView.downloadedFrom(url: urlToPass!)
    }

}
