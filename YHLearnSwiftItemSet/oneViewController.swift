//
//  oneViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/18.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class oneViewController: UIViewController {
    var resetButton:UIButton!
    var playButton:UIButton!
    var pauseButton:UIButton!
    var titleLabel:UILabel!
    
    
    
    var count = 0.0
    var Timer = Foundation.Timer()
    var isPlaying = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        self.resetButton = UIButton.init(frame: CGRect.init(x: 20, y: 84, width: 100, height: 50))
        self.view.addSubview(self.resetButton)
        self.playButton = UIButton.init(frame: CGRect.init(x: 0, y: self.view.frame.size.height*0.5, width: self.view.frame.size.width*0.5, height: self.view.frame.size.height*0.5))
        self.view.addSubview(self.playButton)
        self.pauseButton = UIButton.init(frame: CGRect.init(x: self.view.frame.size.width*0.5, y: self.view.frame.size.height*0.5, width: self.view.frame.size.width*0.5, height: self.view.frame.size.height*0.5))
        self.view.addSubview(self.pauseButton)
        self.titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 100, width: self.view.frame.size.width, height: 70))
        self.view.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        self.titleLabel.textColor = UIColor.white
        self.resetButton.setTitle("重置", for: UIControlState.normal)
        self.playButton.setTitle("播放", for: UIControlState.normal)
        self.pauseButton.setTitle("暂停", for: UIControlState.normal)
        self.resetButton.backgroundColor = UIColor.brown
        self.pauseButton.backgroundColor = UIColor.green
        self.playButton.backgroundColor = UIColor.red
        self.titleLabel.textAlignment = NSTextAlignment.center
        
        self.resetButton.addTarget(self, action: #selector(resetBtn), for: UIControlEvents.touchUpInside)
        self.playButton.addTarget(self, action: #selector(playBtn), for: UIControlEvents.touchUpInside)
        self.pauseButton.addTarget(self, action: #selector(pauseBtn), for: UIControlEvents.touchUpInside)

        self.titleLabel.text = String(count)
        
        
        // Do any additional setup after loading the view.
    }
    //重置
    func resetBtn() -> Void {
        print("重置")
        Timer.invalidate()
        isPlaying = false
        count = 0.0
        titleLabel.text = String(count)
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    func playBtn() -> Void {
        print("播放")
        if isPlaying {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    func pauseBtn() -> Void {
        print("暂停")
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        Timer.invalidate()
        isPlaying = false
    }
    func update(){
        count = count+0.1
        titleLabel.text = String(format: "%.1f", count)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
