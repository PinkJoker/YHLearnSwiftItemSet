//
//  fiveCollectionViewCell.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class fiveCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView?
    var titleLabel:UILabel?
    var detailLabel:UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.setView()
        
    }

    func setView(){
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height - 60))
        contentView.addSubview(imageView!)
        imageView?.backgroundColor = UIColor.cyan
        titleLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 40, height: 20))
        contentView.addSubview(titleLabel!)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        detailLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.size.height - 30, width: contentView.frame.size.width - 40, height: 20))
        contentView.addSubview(detailLabel!)
        detailLabel?.numberOfLines = 2
        detailLabel?.lineBreakMode = .byCharWrapping
        detailLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    var dataes:dataSources!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        imageView?.image = dataes.featImageName
        titleLabel?.text = dataes.title
        detailLabel?.text = dataes.description
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
