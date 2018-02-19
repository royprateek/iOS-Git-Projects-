//
//  ViewController.swift
//  Custom Cell With Swift
//
//  Created by Prateek Roy on 02/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var detail = [Details]()
    
    let companyNames = ["IBM","Apple","HP Enterprise","Accenture","Oracle","SAP","TCS","Cognizant","Capgemini"]
    let companyCeo = ["Ginni Rometty","Tim Cook","Meg Whitman","Pierre Nanterme","Mark Hurd","Bill McDermott","Rajesh Gopinathan","Francisco D'Souza","Paul Hermelin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set website-date and add to the array
        let ibm = Details(website: "www.ibm.com", year: "1911")
        detail.append(ibm)
        let apple = Details(website: "www.apple.com", year: "1976")
        detail.append(apple)
        let hpe = Details(website: "www.hpe.com", year: "1939")
        detail.append(hpe)
        let accen = Details(website: "www.accenture.com", year: "1989")
        detail.append(accen)
        let oracle = Details(website: "www.oracle.com", year: "1977")
        detail.append(oracle)
        let sap = Details(website: "www.sap.com", year: "1972")
        detail.append(sap)
        let tcs = Details(website: "www.tcs.com", year: "1968")
        detail.append(tcs)
        let cogni = Details(website: "www.cognizant.com", year: "1994")
        detail.append(cogni)
        let capge = Details(website: "www.capgemini.com", year: "1967")
        detail.append(capge)
        
    }

    //MARK: Data Source Methods
        func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellCEO.text = companyCeo[indexPath.row]
        cell.cellCompany.text = companyNames[indexPath.row]
        cell.cellImage.image = UIImage(named: companyNames[indexPath.row])
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height / 2
        
        return cell
    }
    
    //MARK: Height Of Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //MARK: Perform Segue Using Selected Row in Table View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "toDetailedVC", sender: companyWebsites[indexPath.row]) //for individual sender
        performSegue(withIdentifier: "toDetailedVC", sender: self)
        
    }
    
    //MARK: Prepare Segue To DetailedViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as? DetailedViewController{
            //destination.captureWebsite = sender as! String //for individual sender
            destination.newDetail = detail[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
}

