//
//  Constants.swift
//  ToDo UserDefaults
//
//  Created by Prateek Roy on 08/02/18.
//  Copyright © 2018 Prateek Roy. All rights reserved.
//

import Foundation

var todoList : [String]?

//MARK: Save Data To NSUserDefault
func saveData(todoList : [String]){
    UserDefaults.standard.set(todoList, forKey: "todoList")
}

//MArk: Fetch Data To NSUserDefault
func fetchData() -> [String]?{
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String]{
        return todo
    }else{
        return nil
    }
    
}

