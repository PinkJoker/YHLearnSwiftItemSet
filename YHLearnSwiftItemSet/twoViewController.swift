//
//  twoViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/18.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class twoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var tableView:UITableView!
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    var fontRowIndex = 0
    var changeFontButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height*0.5), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.backgroundColor = UIColor.white
        changeFontButton = UIButton.init(frame: CGRect.init(x: self.view.frame.size.width*0.5 - 60, y: self.view.frame.size.height*0.6, width: 120, height: 100))
        self.view.addSubview(changeFontButton)
        changeFontButton.backgroundColor = UIColor.cyan
        changeFontButton.addTarget(self, action: #selector(changeButton), for: UIControlEvents.touchDown)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.cyan
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size: 16)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func changeButton(){
        fontRowIndex = (fontRowIndex + 1) % 5
        tableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
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
