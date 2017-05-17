//
//  sixTeenMenuViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/10.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class sixTeenMenuViewController: UIViewController {

    let transitionManager = sixMenuManager()
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!


    override func viewDidLoad() {

   
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true) { 
            self.navigationController?.isNavigationBarHidden = false
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
