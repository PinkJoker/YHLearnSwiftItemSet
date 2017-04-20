//
//  dataSource.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/20.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class dataSources
{

    //MARK -public api
    var title = ""
    var description = ""
    var featImageName:UIImage?
    
    init(title:String ,description: String, featName:UIImage!)
    {
        
        self.title = title
        self.description = description
        self.featImageName = featName

    }
    
    //MARK -private
    static func setDataSource() -> [dataSources]{
        return [
            dataSources(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featName: UIImage(named: "1.jpg")!),
            dataSources(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featName: UIImage(named: "2.jpg")!),
            dataSources(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featName: UIImage(named: "3.jpg")!),
            dataSources(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨",featName: UIImage(named: "4.jpg")!),
            dataSources(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featName: UIImage(named: "5.jpeg")!),
            dataSources(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featName: UIImage(named: "6.jpeg")!),
        ]
    }
    
    
    
    
    
    
    
    
    
    
}
