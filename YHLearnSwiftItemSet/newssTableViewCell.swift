//
//  newssTableViewCell.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/3.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class newssTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconImage.layer.cornerRadius = iconImage.frame.width / 2
        iconImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
