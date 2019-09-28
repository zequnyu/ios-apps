//
//  JokeTableViewController.swift
//  JokeBank
//
//  Created by Anthony Yu on 9/10/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController {
    var jokes = ["Chicken", "Walk into a bar..."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = jokes[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedJoke = jokes[indexPath.row]
        performSegue(withIdentifier: "moveToJokeDefinition", sender: selectedJoke)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let jokeVC = segue.destination as? JokeDefinitionViewController {
            if let selectedJoke = sender as? String {
                jokeVC.joke = selectedJoke
            }
        }
    }
}
