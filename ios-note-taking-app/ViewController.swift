//
//  ViewController.swift
//  ios-note-taking-app
//
//  Created by Enjelina on 05/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    var data: [String] = []
    var fileURL: URL!

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        /// Create "Add Bar Button Item"
        let addbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addbutton
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fileURL = baseURL.appendingPathComponent("note.txt")
        
        load()
        
    }
    
    @objc func addNote(){
        if table.isEditing { return }
        let name: String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        
        self.performSegue(withIdentifier: "detail", sender: nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    func save() {
        // UserDefaults.standard.set(data, forKey: "notes")
        let a = NSArray(array: data)
        do {
            try a.write(to: fileURL)
        } catch  {
            print("Opps! Error writing file")
        }
    }
    
    func load() {
        if let loadedData: [String] = NSArray(contentsOf: fileURL) as? [String] {
            data = loadedData
            table.reloadData()
        }
    }
    
    
    


}

