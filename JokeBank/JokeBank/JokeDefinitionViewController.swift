//
//  JokeDefinitionViewController.swift
//  JokeBank
//
//  Created by Anthony Yu on 9/12/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class JokeDefinitionViewController: UIViewController {
    var joke = ""
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = joke
        if joke == "Chicken" {
            jokeLabel.text = "Q: Why did the chicken cross the road?\n\nA: To get to the other side."
        }
        
        if joke == "Walk into a bar..." {
            jokeLabel.text = "Q: 🤩?\n\nA: 😍."
        }
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
