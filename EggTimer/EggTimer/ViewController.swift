//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var player: AVAudioPlayer!
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    var hasAnotherJob = false
    
    var timer = Timer()
    
    @IBAction func hardnessSelect(_ sender: UIButton) {
        hasAnotherJob = true
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        textLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        else {
            timer.invalidate()
            textLabel.text = "DONE!"
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            hasAnotherJob = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                if !self.hasAnotherJob {
                    self.textLabel.text = "How do you like your eggs?"
                }
            }
        }
    }
}
