//
//  rootViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/18.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
import SnapKit
class rootViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var rootTableView:UITableView!
    let titleArray:Array = ["oneDay","twoDay","three","four","five","six","seven","eight","nine","ten","eleven","12","13","14","15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootTableView = UITableView.init()
        self.view.addSubview(self.rootTableView)
        self.rootTableView.dataSource = self
        self.rootTableView.delegate = self
        self.rootTableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    
//        self.rootTableView.
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let   cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let oneView = oneViewController()
            self.navigationController?.pushViewController(oneView, animated: true)
        }else if indexPath.row == 1{
            let twoView = twoViewController()
             self.navigationController?.pushViewController(twoView, animated: true)
        }else if indexPath.row == 2{
            let threeView = videoListViewController()
            self.navigationController?.pushViewController(threeView, animated: true)
        }else if indexPath.row == 3{
            let fourView = fourViewController()
            self.navigationController?.pushViewController(fourView, animated: true)
        }else if indexPath.row == 4{
            let fiveView = fiveViewController()
            self.navigationController?.pushViewController(fiveView, animated: true)
            
        }
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
