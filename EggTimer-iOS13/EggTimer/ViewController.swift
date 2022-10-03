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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes : [String:Int] = ["Soft":300,"Medium":420,"Hard":720]
    
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness:String = sender.currentTitle!
            
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
                  
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        }

        @objc func updateCounter() {
            //example functionality
            if(secondsPassed < totalTime) {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed)/Float(totalTime)
                
            }else {
                timer.invalidate()
                titleLabel.text = "Done"
                playSound()
                            }
        }
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }

    
}
