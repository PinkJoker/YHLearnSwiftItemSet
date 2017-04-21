//
//  eightViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/20.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
let gradientLayer = CAGradientLayer()
var time:Timer?
var isPlaying = false

class eightViewController: UIViewController {
    
    var musicButton:UIButton?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
     //   UIApplication.shared.isStatusBarHidden = true
        
        self.setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        
    musicButton = UIButton(frame: CGRect(x: self.view.center.x - 40, y: self.view.center.y-40, width: 80, height: 80))
    view.addSubview(musicButton!)
    musicButton?.backgroundColor = UIColor.brown
        musicButton?.layer.cornerRadius = 40
        musicButton?.clipsToBounds = true
        musicButton?.layer.shadowOffset = CGSize(width: 3, height: 5)
        musicButton?.layer.shadowColor = UIColor.brown.cgColor
        musicButton?.layer.shadowRadius = 5
        musicButton?.layer.shadowOpacity = 5
        musicButton?.addTarget(self, action: #selector(touchMusicButton), for: .touchDown)
        self.randomColor()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension eightViewController{
    func touchMusicButton(){
        
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "am", ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            
            if isPlaying == false {
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                isPlaying = true
            }else{
                audioPlayer.pause()
                isPlaying = false
            }
        } catch _ as NSError {
            
        }
        if time == nil {
            time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.4, alpha: 0.3).cgColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.3).cgColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.6).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.2).cgColor
        let color5 = UIColor(white: 0.6, alpha: 0.4).cgColor
        gradientLayer.colors = [color1,color2,color3,color4,color5]
        gradientLayer.locations = [0.10,0.35,0.55,0.75,0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gradientLayer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
//        audioPlayer
    }

    
    
}
extension  eightViewController{
    func randomColor(){
        let redV = CGFloat(drand48())
        let blueV = CGFloat(drand48())
        let greenV = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redV, green: greenV, blue: blueV, alpha: 1)
    }
}

