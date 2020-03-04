//
//  ViewController.swift
//  ios-note-taking-app
//
//  Created by Enjelina on 05/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    
    var data: [String] = []

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        /// Create "Add Bar Button Item"
        let addbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addbutton
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        load()
        
    }
    
    @objc func addNote(){
        if table.isEditing { return }
        let name: String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        
        save()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
     }
     
    /// Handle editButtonItem
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    
    // Remove the object from data array
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(data, forKey: "notes")
    }
    
    func load() {
        if let loadedData: [String] = UserDefaults.standard.value(forKey: "notes") as? [String] {
            data = loadedData
            table.reloadData()
        }
    }
    
    
    


}

