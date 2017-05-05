//
//  fifthViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/3.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

struct resource {
   let bgimage:String
    let titleText:String
    let authorText:String
    let iconImage:String
}




class fifthViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, MenuTransitionManagerDelegate {
     let menuView = dropDownMenuManager()
    var newsTableView:UITableView?
    
    var data = [
        resource(bgimage: "1", titleText: "Love Mountain", authorText: "jack", iconImage: "a"),
        resource(bgimage: "2", titleText: "New graphic design - LIVE FREE", authorText: "Cole", iconImage: "b"),
        resource(bgimage: "3", titleText: "Summer sand", authorText: "Daniel", iconImage: "c"),
        resource(bgimage: "4", titleText: "Seeking for hand", authorText: "kenobi", iconImage: "d"),
         resource(bgimage: "5", titleText: "Seeking for hand", authorText: "kenobi", iconImage: "e")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView = UITableView(frame:CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), style: .plain)
        view.addSubview(newsTableView!)
        newsTableView?.delegate = self
        newsTableView?.dataSource = self
        self.title = "Everyday Moments"
        newsTableView?.separatorStyle = .none
        view.backgroundColor = UIColor(red: 0.062, green: 0.062, blue: 0.07, alpha: 1)
//        let nib = UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>)
        newsTableView?.register(UINib(nibName:"newssTableViewCell",bundle: nil), forCellReuseIdentifier: "listCell")
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下拉", style: .plain, target: self, action: #selector(touchItem))
    }
    
    func touchItem(){
        let menuVC = MenuTableViewController()
        menuVC.transitioningDelegate = menuView
        menuView.delegate = self
        self.present(menuVC, animated: true) { 
            
        }
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension fifthViewController{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! newssTableViewCell
        let indexData = data[indexPath.row]
        cell.bgImage.image = UIImage(named: indexData.bgimage)
        cell.titleLabel.text = indexData.titleText
        cell.detailLabel.text = indexData.authorText
        cell.iconImage.image = UIImage(named: indexData.iconImage)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
}
