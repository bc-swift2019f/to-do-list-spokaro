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
    var toDoNoteItem: String?
    
    @IBOutlet weak var saveBarBUtton: UIBarButtonItem!
    
    @IBOutlet weak var toDoNoteView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "New To Do Item"
        }else{
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
            
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarBUtton.isEnabled = true
        }else{
            saveBarBUtton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enableDisableSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
            
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
