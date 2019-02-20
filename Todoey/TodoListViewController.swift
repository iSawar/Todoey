//
//  ViewController.swift
//  Todoey
//
//  Created by Bartłomiej Sawarski on 20/02/2019.
//  Copyright © 2019 Bartłomiej Sawarski. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell!.accessoryType == .none {
            cell?.accessoryType = .checkmark
        }
        else
        {
            cell?.accessoryType = .none
        }
    }

}

