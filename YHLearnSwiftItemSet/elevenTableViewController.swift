//
//  elevenTableViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/24.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class elevenTableViewController: UITableViewController {
  let tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tablecell")
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
        return tableData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
      
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    func colorForIndex(_ index: Int) -> UIColor{
        let itemColor = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemColor)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.4, alpha: 1.0)
    }
    
    func animateTableView(){
        
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight:CGFloat = 200
        for i in cells {
            let cell:UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for a in cells{
            let cell:UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5 , delay: 0.05 * Double(index), usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTableView()
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


}

extension elevenTableViewController{
    
   //  fileprivate func data() -> NSArray {
  
       // return tableData as NSArray
   //}
    
}
