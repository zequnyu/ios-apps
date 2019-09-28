//
//  JokeDefinitionViewController.swift
//  JokeBank
//
//  Created by Anthony Yu on 9/12/19.
//  Copyright © 2019 Zequn Yu. All rights reserved.
//

import UIKit

class JokeDefinitionViewController: UIViewController {
    var joke = Joke()
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = joke.title
        jokeLabel.text = joke.text
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
