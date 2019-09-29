//
//  CreateTodoViewController.swift
//  Todo
//
//  Created by Anthony Yu on 9/28/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var todoTableVC : TodoTableViewController? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTodo(_ sender: Any) {
        let newTodo = Todo()
        newTodo.important = importantSwitch.isOn
        if let name = nameTextField.text {
            newTodo.name = name
        }
        
        todoTableVC?.todos.append(newTodo)
        todoTableVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
