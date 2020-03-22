//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.checkAnswer(for: sender.currentTitle!) {
            sender.setBackgroundImage(UIImage(named: "RectangleGreen"), for: UIControl.State.normal)
        }
        else {
            sender.setBackgroundImage(UIImage(named: "RectangleRed"), for: UIControl.State.normal)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getCurrentText()
        trueButton.setBackgroundImage(UIImage(named: "Rectangle"), for: UIControl.State.normal)
        falseButton.setBackgroundImage(UIImage(named: "Rectangle"), for: UIControl.State.normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getCurrentProgress()
    }
}
