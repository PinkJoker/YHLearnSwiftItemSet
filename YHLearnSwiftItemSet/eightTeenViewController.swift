//
//  eightTeenViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 2017/5/23.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class eightTeenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var refreshController:UIRefreshControl!
    var customView:UIView!
    var labelArray:Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer:Timer!
    var dataArray:Array<String> = ["😎","🐶","🐓","🐒","🐽","🐶"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    let sb = UIStoryboard(name: <#T##String#>, bundle: <#T##Bundle?#>)
        
        tableView.delegate = self
        tableView.dataSource = self
        refreshController = UIRefreshControl()
//        tableView.
        refreshController.backgroundColor = UIColor.clear
        refreshController.tintColor = UIColor.clear
        tableView.addSubview(refreshController)
        
        // Do any additional setup after loading the view.
    }
    
    func loadCustomRefreshContes(){
        
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        
        customView = refreshContents?[0] as! UIView
        customView.frame = refreshController.bounds
        for i in 0 ..< customView.subviews.count {
            print("\(i)")
//            labe
            labelArray.append(customView.viewWithTag(i+1) as! UILabel)
        }
        refreshController.addSubview(customView)
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nib       BundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        
//    }
    func animateRefreshStep1(){
        isAnimating = true
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
            
        self.labelArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
        self.labelArray[self.currentLabelIndex].textColor = nil
        }) { (finished) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
                self.labelArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.labelArray[self.currentLabelIndex].textColor = UIColor.black
            }, completion: { (finished) in
                self.currentLabelIndex += 1
                if self.currentLabelIndex<self.labelArray.count{
                    self.animateRefreshStep1()
                }else{
                    self.animateRefreshStep1()
                }
                
            })
        }
    }
    
    func animateRefreshStep2(){
        UIView.animate(withDuration: 1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
            for index in self.labelArray{
                index.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        }) { (finished) in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { 
                
                
                for index in self.labelArray{
                    index.transform = CGAffineTransform.identity
                }
            }, completion: { (finished) in
                if self.refreshController.isRefreshing{
                    self.currentLabelIndex = 0
                    self.animateRefreshStep1()
                }else{
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    for i in 0..<(self.labelArray.count){
                        self.labelArray[i].textColor = UIColor.black
                        self.labelArray[i].transform = CGAffineTransform.identity
                    
                    }
                }
            })
        }
    }
    
    func getNextColor() -> UIColor {
        var colorsArray:Array<UIColor> = [UIColor.magenta,UIColor.brown,UIColor.yellow,UIColor.red,UIColor.green]
        if currentLabelIndex == colorsArray.count {
            currentLabelIndex = 0
        }
        let returnColor = colorsArray[currentLabelIndex]
        currentLabelIndex += 1
        return returnColor
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            if !isAnimating {
                
            }
        }
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

extension eightTeenViewController{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let   cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataArray[indexPath.row]
//        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
