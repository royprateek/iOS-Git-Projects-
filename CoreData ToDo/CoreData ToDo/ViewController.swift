//
//  ViewController.swift
//  CoreData ToDo
//
//  Created by Prateek Roy on 10/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        grabData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        grabData()
        tableView.reloadData()
    }

    //MARK: DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let task = tasks[indexPath.row]
        if let name = task.name{
            cell.textLabel?.text = "\(name)"
        }
        //cell.textLabel?.text = "\(task.name)"
        
        return cell
    }
    
    //MARK: Fetch Data From Core Data And Save In tasks array
    func grabData()  {
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        do{
        tasks = try context.fetch(Task.fetchRequest())
        }catch{
            print("Error. Could not fetch data from Core Data")
        }
    }
    
    //Delete Data In Core Data And TableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            
            guest.saveContext()
            grabData()
            tableView.reloadData()
        }
    }

}

