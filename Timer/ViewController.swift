//
//  ViewController.swift
//  Timer
//
//  Created by Shogo Yamamoto on 2021/03/08.
//  Copyright © 2021年 めんつゆ. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer : Timer?   //Timerインスタンスの保持
    var currentSeconds = 0  //タイマーの設定時間と経過時間の差分

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        start(seconds: 10)
    }
    
    @IBAction func threeMinButtonTapped(_ sender: UIButton) {
        start(seconds: 180)
    }
    
    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        start(seconds: 300)
    }
    
    func start(seconds: Int){
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)秒"
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                           target: self,
                                           selector: #selector(ViewController.update),
                                           userInfo: nil,
                                           repeats: true)
     } //タイマーを開始するメソッド
    
    @objc func update(){
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)秒"
        if (currentSeconds == 0){
            timer?.invalidate()
            let soundId: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundId)
        }
    } //更新するメソッド
    
}

