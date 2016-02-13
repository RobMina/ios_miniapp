//
//  AddItemViewController.swift
//  testapp
//
//  Created by Robert Mina on 2/12/16.
//  Copyright © 2016 University of Virginia. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var item: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        
        if let item = item {
            navigationItem.title = item.title
            titleField.text   = item.title
            datePicker.date = item.duedate
            descriptionTextView.text = item.description
        }
        
        checkValidTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    func checkValidTitle() {
        let text = titleField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidTitle()
        navigationItem.title = textField.text
    }
    
    
    // MARK: - Navigation

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = titleField.text ?? ""
            let description = descriptionTextView.text ?? ""
            let duedate = datePicker.date
            
            item = ToDoItem(title: title, description: description,
                duedate: duedate)
            
        }
    }
    

}
