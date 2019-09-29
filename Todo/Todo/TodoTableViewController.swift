//
//  TodoTableViewController.swift
//  Todo
//
//  Created by Anthony Yu on 9/28/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo1 = Todo()
        todo1.name = "Walk the dog"
        todo1.important = false
        
        let todo2 = Todo()
        todo2.name = "Buy Milk"
        todo2.important = true
        
        todos = [todo1, todo2]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let currentTodo = todos[indexPath.row]
        if currentTodo.important {
            cell.textLabel?.text = "❗️" + currentTodo.name
        }
        else {
            cell.textLabel?.text = currentTodo.name
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
        }
        if let completeVC = segue.destination as? CompleteViewController {
            if let selectedTodo = sender as? Todo {
                completeVC.todo = selectedTodo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = todos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
}
