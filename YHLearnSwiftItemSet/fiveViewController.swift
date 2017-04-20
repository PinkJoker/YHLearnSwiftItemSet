//
//  fiveViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/19.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class fiveViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    var backGroundImageView:UIImageView!
    var collectView:UICollectionView?
    var currentUserProfileImageButton:UIButton?
    var currentUserFullNameButton:UIButton?
    
    var effectView:UIVisualEffectView?
    var blurEffect:UIBlurEffect?
    
    fileprivate var data = dataSources.setDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        backGroundImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        backGroundImageView.backgroundColor = UIColor.red
        backGroundImageView.isUserInteractionEnabled = true
        backGroundImageView.image = UIImage(named: "beijing.jpg")
        self.view.addSubview(backGroundImageView)
           blurEffect = UIBlurEffect(style: .regular)
        effectView = UIVisualEffectView(effect: blurEffect)
        effectView?.frame = CGRect(x: 0, y: 0, width: (backGroundImageView?.frame.size.width)!, height:UIScreen.main.bounds.size.height)
        backGroundImageView?.addSubview(effectView!)
        
        
        
        let collectLayout = UICollectionViewFlowLayout.init()
        collectLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width * 0.8, height: UIScreen.main.bounds.size.height*0.6)
       collectLayout.scrollDirection = .horizontal
        collectLayout.minimumInteritemSpacing = 20
        collectLayout.minimumLineSpacing = 20
        collectLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)//section的上左下右
        collectView = UICollectionView.init(frame:CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.7), collectionViewLayout: collectLayout)
        backGroundImageView.addSubview(collectView!)
        collectView?.dataSource = self
        collectView?.delegate = self
        collectView?.register(fiveCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectView?.backgroundColor = UIColor.clear
//        collectView?.showsVerticalScrollIndicator = true
       collectView?.showsHorizontalScrollIndicator = false

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! fiveCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.dataes = data[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you are touch item by \(indexPath.item)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


