//
//  ViewController.swift
//  ToDo UserDefaults
//
//  Created by Prateek Roy on 07/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
       
    }
    
    //MARK: View to be appeared
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let todo = todoList{
            return todo.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        if let todo = todoList {
            cell.textLabel?.text = todo[indexPath.row]
        }
        
        return cell
    }
    
    //Swipe to delete feature
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoList?.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}

