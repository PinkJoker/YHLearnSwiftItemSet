//
//  rootViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/18.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
//import SnapKit
class rootViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var rootTableView:UITableView!
    let titleArray:Array = ["oneDay","twoDay","three","four","five","six","seven","eight","nine","ten","eleven","12","13","14","15","16","17","18","19","20","21","22","23","25"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "swift"
        
        
        self.rootTableView = UITableView.init()
        self.view.addSubview(self.rootTableView)
        self.rootTableView.dataSource = self
        self.rootTableView.delegate = self
        self.rootTableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        rootTableView.backgroundColor = UIColor.brown
        rootTableView.tableFooterView = UIView.init()
//        self.rootTableView.
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let oneView = oneViewController()
            navigationController?.pushViewController(oneView, animated: true)
        }else if indexPath.row == 1{
            let twoView = twoViewController()
             navigationController?.pushViewController(twoView, animated: true)
        }else if indexPath.row == 2{
            let threeView = videoListViewController()
            navigationController?.pushViewController(threeView, animated: true)
        }else if indexPath.row == 3{
            let fourView = fourViewController()
            navigationController?.pushViewController(fourView, animated: true)
        }else if indexPath.row == 4{
            let fiveView = fiveViewController()
            navigationController?.pushViewController(fiveView, animated: true)
        }else if indexPath.row == 5{
            let sixView = locationViewController()
            navigationController?.pushViewController(sixView, animated: true)
        }else if indexPath.row == 6{
            let sevenView = sevenViewController()
            navigationController?.pushViewController(sevenView, animated: true)
        }else if indexPath.row == 7{
            let eightView = eightViewController()
        navigationController?.pushViewController(eightView, animated: true)
        }else if indexPath.row == 8{
            let nineView = nineViewController()
            navigationController?.pushViewController(nineView, animated: true)
        }else if indexPath.row == 9{
            
            
        }else if indexPath.row == 10{
            let eleven = elevenTableViewController()
            navigationController?.pushViewController(eleven, animated: true)
        }else if indexPath.row == 11{
            let twelve = twelveViewController()
            navigationController?.pushViewController(twelve, animated: true)
        }else if indexPath.row == 12{
            let thirteen = thirteenViewController()
            navigationController?.pushViewController(thirteen, animated: true)
        }else if indexPath.row == 14{
            let fifteen = fifthViewController()
            navigationController?.pushViewController(fifteen, animated: true)
        }else if indexPath.row == 15{
            let sixteen = sixTeenViewController()
            navigationController?.pushViewController(sixteen, animated: true)
        }else if indexPath.row == 16{
            let seventeen = SeventeenViewController()
            navigationController?.pushViewController(seventeen, animated: true)
        }else if indexPath.row == 17{
            let eightteen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "eightteen") as! eightTeenViewController
//            let vc = eighttee
            navigationController?.pushViewController(eightteen, animated: true)
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


extension rootViewController{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let   cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
