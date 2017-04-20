//
//  sevenViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/20.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class sevenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var refreshTableViewController = UITableViewController()
    var  formerData:[String] = ["🐶🐶🐶🐶🐶🐶🐶","🐱🐱🐱🐱🐱🐱🐱","🐖🐖🐖🐖🐖🐖","🐍🐍🐍🐍🐍🐍🐍","🐔🐔🐔🐔🐔🐔🐔🐔🐔","🐰🐰🐰🐰🐰🐰🐰🐰"]
    let addData = ["📚📚📚📚📚📚📚","🌲🌲🌲🌲🌲🌲🌲","🐭🐭🐭🐭🐭🐭🐭","书书书书书书书书书书"]
    
    var data = [String]()
    var refresh:UIRefreshControl?

          let attributes = [NSForegroundColorAttributeName:UIColor.white]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshTableView = refreshTableViewController.tableView
        refreshTableView?.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 64)
        refreshTableView?.delegate = self
        refreshTableView?.dataSource = self
        
        refresh = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        refreshTableView?.refreshControl = refresh
        
        refresh?.addTarget(self, action: #selector(refreshMore), for: .valueChanged)
        refresh?.backgroundColor = UIColor.black
        refresh?.attributedTitle = NSAttributedString(string: "最后一次刷新时间:"+"\(self.date())", attributes: attributes)
        
        refresh?.tintColor = UIColor.cyan
        
        refreshTableView?.rowHeight = UITableViewAutomaticDimension
        refreshTableView?.estimatedRowHeight = 60.0
        refreshTableView?.tableFooterView = UIView(frame: CGRect.zero)
        refreshTableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.view.addSubview(refreshTableView!)

        // Do any additional setup after loading the view.
    }
    
    
    func refreshMore(){
        formerData .append(contentsOf: addData)
        refresh?.attributedTitle = NSAttributedString(string: "最后一次刷新时间:"+"\(self.date())", attributes: attributes)
        refreshTableViewController.tableView.reloadData()
        refresh?.endRefreshing()
    }
    
    //MARK  -当前时间
    func date() -> String{
        let dateF = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MM-dd 'at' HH:mm:ss"
        let nowTime = timeFormatter.string(from: dateF as Date) as String
        return nowTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension sevenViewController{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = formerData[indexPath.row]
         cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return formerData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
