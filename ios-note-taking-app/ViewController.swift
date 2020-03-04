//
//  ViewController.swift
//  ios-note-taking-app
//
//  Created by Enjelina on 05/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    
    var data: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        /// Create "Add Bar Button Item"
        let addbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem =  addbutton
        
        
    }
    
    @objc func addNote(){
        let name: String = "Item \(data.count + 1)"
        data.insert(name, at: 0)
        
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
     }
     
    


}

