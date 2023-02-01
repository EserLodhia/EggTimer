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
    
    //    let softTime = 5
    //    let mediumTime = 7
    //    let hardTime = 12
    //
    
    //using *Dictionary* instead of seperate constants
    var eggTimes = ["Soft": 5, "Medium": 20, "Hard": 120]
    var timer = Timer()
    var player: AVAudioPlayer!
    //var counter = 60
    
    @IBOutlet weak var percentBar: UIProgressView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

//        eggTimes["Soft"] = 300
//        eggTimes["Medium"] = 420
//        eggTimes["Hard"] = 720
        
        timer.invalidate()
        var totalTime:Float = 0
        let hardness = sender.currentTitle!
        var secondsPassed:Float = 0
        
        
        totalTime = Float(eggTimes[hardness]!)
        myLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            
//            func setProgress() {
//                self.percentBar.setProgress(Float(progress), animated: true)
//
//            }
            
            
//            if totalTime <= 300 {
//                progress += 0.00333333
//            } else if totalTime <= 420 {
//                progress += 0.00238095
//            } else if totalTime <= 720 {
//                progress += 0.00138889
//            } else {
//                print("Error")
//            }
            
            if secondsPassed <= totalTime {
                
                percentBar.progress = Float(secondsPassed) / Float(totalTime)
                
                secondsPassed += 1
//                progress += 0.0033
                self.myLabel.text = "How do you like your eggs?"
                //setProgress()
            } else {
                Timer.invalidate()
                self.myLabel.text = "Done!"
                
                    let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
                    print("URLvalue is: \(String(describing: url))")
            }
            
            
        
            //        if hardness == "Soft" {
            //        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            //        }
            
            
            //Using dictionaries
            //print(eggTimes[hardness])
            
            
            //using IF statement
            //        if hardness == "Soft" {
            //            print(softTime)
            //        } else if hardness == "Medium" {
            //            print(mediumTime)
            //        } else {
            //            print(hardTime)
            //        }
            
            //Using Switch statement
            //        switch hardness {
            //        case "Soft": print(softTime)
            //        case "Medium": print(mediumTime)
            //        case "Hard": print(hardTime)
            //        default: print("")
            //        }
            //        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            //            if secondsRemaining > 0 {
            //                print ("\(secondsRemaining) seconds")
            //                secondsRemaining -= 1
            //            } else {
            //                Timer.invalidate()
            //                print("Your eggs are ready!")
            //            }
            //        }
            
        }
        
        //    @objc func timerAction() {
        //            counter -= 1
        //            print("\(counter)")
        //    }
        
        
    }
    
    
}
