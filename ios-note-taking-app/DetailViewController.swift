//
//  DetailViewController.swift
//  ios-note-taking-app
//
//  Created by Enjelina on 05/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var text: String = ""
    var masterView: ViewController!

    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = text

    }
    
    func setText(t: String) {
        text = t
        if isViewLoaded {
            textView.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        masterView.newRowText = textView.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
