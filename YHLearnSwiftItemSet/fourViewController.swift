//
//  fourViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class fourViewController: UIViewController {

    var scrollView:UIScrollView?
    let left = leftView()
    let center = centerView()
    let right = rightViewVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.view.addSubview(scrollView!)
        scrollView?.contentSize = CGSize.init(width: UIScreen.main.bounds.size.width*3, height:0)
//        scrollView?.showsVerticalScrollIndicator = true
        scrollView?.isPagingEnabled = true
        
        left.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView?.addSubview(left)
        center.frame = CGRect.init(x: UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height)
        scrollView?.addSubview(center)
        
        right.view.frame = CGRect.init(x: UIScreen.main.bounds.size.width*2, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        scrollView?.addSubview(right.view)
        
        // Do any additional setup after loading the view.
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
