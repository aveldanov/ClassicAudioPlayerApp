//
//  ViewController.swift
//  ClassicAudioPlayerApp
//
//  Created by Veldanov, Anton on 5/1/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  var player = AVAudioPlayer()
  var timer = Timer()
     let audioPath = Bundle.main.path(forResource: "mozart", ofType: "mp3")
  
  
  
  @IBOutlet weak var volumeOutlet: UISlider!
  @IBOutlet weak var positionOutlet: UISlider!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

 
    
    do{
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
      
      positionOutlet.maximumValue = Float(player.duration)
      
      
      
    }catch{
      
      
      
    }

  }
  
  
  @IBAction func pauseButtonPressed(_ sender: UIBarButtonItem) {
    player.pause()
    timer.invalidate()
  }
  
  @IBAction func playButtonPressed(_ sender: UIBarButtonItem) {
    player.play()
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(updateSliderPosition), userInfo: nil, repeats: true)
    
  }
  @IBAction func stopButtonPressed(_ sender: UIBarButtonItem) {
    player.pause()
    timer.invalidate()

    // resetting the player
    do{
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
    }catch{

    }
  }
  
  
  
  
  @IBAction func possitionTapped(_ sender: UISlider) {
    
    
    player.currentTime = TimeInterval(positionOutlet.value)
    
    
  }
  
  
  
  @IBAction func volumeTapped(_ sender: UISlider) {
    player.volume = volumeOutlet.value
  }
  
  
  @objc func updateSliderPosition(){
    
    positionOutlet.value = Float(player.currentTime)
  }
  

}

