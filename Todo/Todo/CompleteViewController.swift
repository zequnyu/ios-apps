//
//  CompleteViewController.swift
//  Todo
//
//  Created by Anthony Yu on 9/28/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    var todo = Todo()
    
    @IBOutlet weak var todoLabel: UILabel!
    
    
    @IBAction func CompleteTodo(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        todoLabel.text = todo.name
    }
    
    

}
