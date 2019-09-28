//
//  JokeTableViewController.swift
//  JokeBank
//
//  Created by Anthony Yu on 9/10/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class JokeTableViewController: UITableViewController {
    var jokes : [Joke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joke1 = Joke()
        joke1.title = "Chicken"
        joke1.text = "Q: Why did the chicken cross the road?\n\nA: To get to the other side."
        
        let joke2 = Joke()
        joke2.title = "Walk into a bar..."
        joke2.text = "Q: 🤩?\n\nA: 😍."
        
        jokes = [joke1, joke2]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = jokes[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedJoke = jokes[indexPath.row]
        performSegue(withIdentifier: "moveToJokeDefinition", sender: selectedJoke)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let jokeVC = segue.destination as? JokeDefinitionViewController {
            if let selectedJoke = sender as? Joke {
                jokeVC.joke = selectedJoke
            }
        }
    }
}
