//
//  videoListViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class videoListViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    var videoTableView:UITableView!
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    var playViewVC = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        videoTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.plain)
        videoTableView.dataSource = self
        videoTableView.delegate = self
        self.view.addSubview(videoTableView)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "videocell")
        cell.playButton.addTarget(self, action: #selector(touchButton), for: UIControlEvents.touchDown)
        let videoIndex = data[indexPath.row]
        
        cell.videoTitleLabel.text = videoIndex.title
        cell.videoSourceLabel.text = videoIndex.source
        cell.videoImageView.image = UIImage(named: videoIndex.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height*0.3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func touchButton(){
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewVC.player = playerView
        self.present(playViewVC, animated: true) { 
            self.playViewVC.player?.play()
        }
        
        
        
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
