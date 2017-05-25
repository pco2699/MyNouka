//
//  ViewController.swift
//  MyJamesBlake
//
//  Created by pco2699 on 2017/05/20.
//  Copyright © 2017年 pco2699. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    playt.layer.borderColor = UIColor.gray.cgColor
    playt.layer.borderWidth = 1
    
    stopt.layer.borderColor = UIColor.gray.cgColor
    stopt.layer.borderWidth = 1

    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MP3のパスの設定
  let noukaPath = Bundle.main.bundleURL.appendingPathComponent("nouka.aif")
  let itu_noukaPath = Bundle.main.bundleURL.appendingPathComponent("itu_nouka.aif")

  let rakunoukaPath = Bundle.main.bundleURL.appendingPathComponent("rakunouka.aif")
  let itu_rakunoukaPath = Bundle.main.bundleURL.appendingPathComponent("itu_rakunouka.aif")

  
  
  let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("NOUKA.wav")
  
  // Playerのインスタンス生成
  var noukaPlayer = AVAudioPlayer()
  var itu_noukaPlayer = AVAudioPlayer()
  
  var rakunoukaPlayer = AVAudioPlayer()
  var itu_rakunoukaPlayer = AVAudioPlayer()

  var backmusicPlayer = AVAudioPlayer()
  
  
  @IBOutlet weak var playt: UIButton!
  @IBOutlet weak var stopt: UIButton!
  @IBAction func button1(_ sender: Any) {
    soundPlayer(&noukaPlayer, path: noukaPath, count: 0)
  }

  @IBAction func button2(_ sender: Any) {
    soundPlayer(&itu_noukaPlayer, path: itu_noukaPath, count: 0)
  }
  
  @IBAction func button3(_ sender: Any) {
    soundPlayer(&rakunoukaPlayer, path: rakunoukaPath, count: 0)
  }
  @IBAction func button4(_ sender: Any){
    soundPlayer(&itu_rakunoukaPlayer, path: itu_rakunoukaPath, count: 0)
  }
  
  @IBAction func play(_ sender: Any) {
    soundPlayer(&backmusicPlayer, path: backmusicPath, count: -1)
  }
  @IBAction func stop(_ sender: Any) {
    backmusicPlayer.stop()
  }
  
  fileprivate func soundPlayer(_ player:inout AVAudioPlayer, path: URL, count: Int) {
    do {
      player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
      player.numberOfLoops = count
      player.play()
    } catch {
      print("エラーが発生しました！")
    }
  }
}

