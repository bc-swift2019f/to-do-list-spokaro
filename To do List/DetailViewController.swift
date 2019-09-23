//
//  DetailViewController.swift
//  To do List
//
//  Created by Andrew Boucher on 9/22/19.
//  Copyright © 2019 Andres de la Cruz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentindInAddMode = presentingViewController is UINavigationController
        if isPresentindInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
