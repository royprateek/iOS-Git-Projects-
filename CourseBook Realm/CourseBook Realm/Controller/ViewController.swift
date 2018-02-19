//
//  ViewController.swift
//  CourseBook Realm
//
//  Created by Prateek Roy on 17/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fetchedCourse : Results<Course>?

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource =  self
        
        //MARK: Fetched Values From Realm
        let realm = try? Realm()
        fetchedCourse = realm?.objects(Course.self).sorted(byKeyPath: "name", ascending: true)
    }
    
    
    //MARK: View Life Cycle State For Tableview Data Reload
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    //MARK: DataSource Methods For Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: DataSource Methods For Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = fetchedCourse?.count{
            return count
        }
        return 0
    }
    
    //MARK: DataSource Methods For CellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let course = fetchedCourse?[indexPath.row]
        cell.textLabel?.text = course?.name
        cell.detailTextLabel?.text = course?.email
        
        return cell
    }
    
    
    //MARK: Perform Segue To AddViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = fetchedCourse?[indexPath.row]
        performSegue(withIdentifier: "seeAll", sender: course)
    }
    
    
    //MARK: Prepare Segue For Data Passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeAll"{
            if let destination = segue.destination as? AddViewController{
                if let course = sender as? Course{
                    destination.existingCourse = course
                }
            }
        }
    }
    
    
    //MARK: Swipe To Delete Rows In TableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let course  = fetchedCourse![indexPath.row]
            
            let realm = try? Realm()
            try! realm?.write {
                realm?.delete(course)
            }
            
            tableView.reloadData()
        }
    }

}

