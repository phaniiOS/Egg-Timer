//
//  ViewController.swift
//  Egg Timer
//
//  Created by IMCS2 on 2/10/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentTime = 0
    weak var timer: Timer?
    var flag = true
    var isRunning: Bool = true
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var StartResetOutlet: UIBarButtonItem!
    
    @IBAction func StartResetButton(_ sender: Any) {
        print("In StartReset")
        if flag{
            flag = false
            StartResetOutlet.title = "Reset"
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            // Set Start/Stop button to true
        }
        else{
            flag = true
            StartResetOutlet.title = "Start"
            currentTime=0
            updateCounter(val:0)
            timer?.invalidate()
        }
    }
    
    @IBAction func PauseButton(_ sender: Any) {
        isRunning=false
        timer?.invalidate()
//        print(pTime)
        
    }
    
    @IBAction func PlayButton(_ sender: Any) {
        if(!isRunning){
            isRunning=true
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func Back10s(_ sender: Any) {
        if currentTime-1000 <= 0{
            currentTime=0
            updateCounter(val: 0)
        }
        else {
            currentTime -= 1001
            updateCounter(val: 1)
        }
    }
    
    
    @IBAction func Forward10s(_ sender: Any) {
        currentTime += 999
        updateCounter(val: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateCounter(val: Int) {
        if(val==0){
            currentTime=0
        }
        else {
            currentTime += 1
        }
        TimeLabel.text="\(currentTime / 6000) : \(currentTime%6000/100) : \((currentTime%100)%100)"
    }
}

