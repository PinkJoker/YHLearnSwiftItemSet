//
//  videoTableViewCell.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit


struct video {
    let image:String
    let title:String
    let source:String
}

class videoTableViewCell: UITableViewCell {

    var videoImageView:UIImageView!
    var videoSourceLabel = UILabel()
    var videoTitleLabel = UILabel()
    var playButton:UIButton!
    
    override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func  setUpView(){
        self.contentView.backgroundColor = UIColor.yellow
        videoImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.3))
        self.contentView.addSubview(videoImageView)
        videoImageView.backgroundColor = UIColor.green
        videoImageView.image = UIImage.init(named: "videoScreenshot01")
        playButton = UIButton.init(frame:CGRect.init(x: UIScreen.main.bounds.size.width*0.5 - 80, y: 40 , width: 160, height: 100))
     //   playButton.frame = CGRect.init(x: self.contentView.center.x - 80, y:self.contentView.center.y, width: 160, height: 100)
        playButton.setImage(UIImage.init(named: "playBtn"), for: UIControlState.normal)
        self.contentView.addSubview(playButton)
   //     playButton.backgroundColor = UIColor.magenta
        videoSourceLabel = UILabel.init(frame: CGRect.init(x: UIScreen.main.bounds.size.width*0.5  - 80, y: 150, width: 150, height: 30))
        videoSourceLabel.textColor = UIColor.white
        videoSourceLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(videoSourceLabel)
        videoTitleLabel = UILabel.init(frame: CGRect.init(x:  UIScreen.main.bounds.size.width*0.5-75, y:180, width: 150, height: 20))
        videoTitleLabel.textColor = UIColor.white
        videoTitleLabel.textAlignment = NSTextAlignment.center
      //  videoTitleLabel.backgroundColor = UIColor.cyan
        self.contentView.addSubview(videoTitleLabel)
        videoTitleLabel.text = "dataSource"
        videoSourceLabel.text = "screenshot"
        
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
