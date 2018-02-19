//
//  ViewController.swift
//  Tableview JSON
//
//  Created by Prateek Roy on 05/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var heroes = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //tableView.allowsSelection  = false
        tableView.showsVerticalScrollIndicator = false
        
        downloadJSON {
            self.tableView.reloadData()
        }
    }

    //Download JSON from API
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("JSON Error")
                }
        }
    }.resume()
}

    //DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        cell?.detailTextLabel?.text = heroes[indexPath.row].attack_type.capitalized
        
        return cell!
    }
    
    //Segue To DetailedViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailedVC", sender: self)
    }
    
    //MARK: Prepare Segue To DetailedViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as? DetailedViewController{
            //destination.captureWebsite = sender as! String
            destination.newHeroes = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
}
