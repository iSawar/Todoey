//
//  ViewController.swift
//  Todoey
//
//  Created by Bartłomiej Sawarski on 20/02/2019.
//  Copyright © 2019 Bartłomiej Sawarski. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["One", "Two", "Three"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
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

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Create new item"
            textField = alertText
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

