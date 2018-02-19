//
//  ViewController.swift
//  CollectionView JSON
//
//  Created by Prateek Roy on 07/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

//MARK: IMAGE DOWNLOAD FROM JSON STACK
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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var Heroes = [HeroStats]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: Fetch JSON Data From Dota API
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.Heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                }catch{
                    print("JSON Error")
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            }.resume()
    }
    
    //MARK: DataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Heroes.count
    }
    
   
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CustomCollectionViewCell
        
        cell?.nameCellLabel.text = Heroes[indexPath.row].localized_name.capitalized
        
        //To set the image of customcell imageview
        let baseURL = "https://api.opendota.com"
        let completeLink = baseURL + Heroes[indexPath.row].img
        cell?.imageview.downloadedFrom(link: completeLink)
        
        cell?.imageview.clipsToBounds = true
        cell?.imageview.layer.cornerRadius = (cell?.imageview.frame.height)! / 2
        cell?.imageview.contentMode = .scaleAspectFill
        
        return cell!
    }

    //MARK: Segue to DetailedViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailedVC", sender: self)
    }
    
    
//    //MARK: Prepare Segue To DetailedViewController
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination  = segue.destination as? DetailedViewController{
//
//        }
//    }
    

}

