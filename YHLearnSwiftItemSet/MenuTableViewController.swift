//
//  MenuTableViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/5.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.black
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        
        
        
        //MARK : 闭包
        bibao()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "SuiBian"
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK：- 排序闭包
    func bibao(){
        //swift学习插入 排序闭包函数显式 sorted(:by)
        let names = ["chris","alex","ewa","barry","daniella"]
        let reversedName = names.sorted { (s1: String, s2: String) -> Bool in
            return s2 > s1
        }
        print("\(reversedName)")
        
        //单表达式闭包隐式返回
       let reversedName1 = names.sorted(by: {s1 , s2 in s1 > s2})
        print("\(reversedName1)")
        
        //参数名称缩写 可以直接通过 $0，$1，$2 来顺序调用闭包的参数
        let reversedName2 = names.sorted(by: {$0 > $1})
        print("\(reversedName2)")
        //运算符方法  Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值
        let reversedName3 = names.sorted(by: >)
        print("\(reversedName3)")
        //尾随闭包   尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
        
        
    }
    
   
    


}


