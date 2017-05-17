//
//  sixTeenViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/10.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class sixTeenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
         self.navigationController?.isNavigationBarHidden = true
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0 , y: view.frame.midY , width: view.frame.size.width , height: 40)
        view.addSubview(titleLabel)
        titleLabel.text = "Touch Title to present"
        titleLabel.textColor = UIColor.cyan
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.isUserInteractionEnabled = true
        let tapTitle = UITapGestureRecognizer.init(target: self, action: #selector(goFaw))
//        tapTitle.addTarget(self, action: #selector(goFaw))
        titleLabel.addGestureRecognizer(tapTitle)
        
        let backLabel = UILabel()
        backLabel.frame = CGRect(x: 0 , y: view.frame.midY + 100, width: view.frame.size.width, height: 40)
        view.addSubview(backLabel)
        backLabel.text = "Touch Back to List"
        backLabel.textColor = UIColor.black
        backLabel.font = UIFont.boldSystemFont(ofSize: 24)
        backLabel.isUserInteractionEnabled = true
        backLabel.textAlignment = .center
    
    
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(back))
        backLabel.addGestureRecognizer(tap)
        
    }
    
    func back(){
       _ = navigationController?.popViewController(animated: true)
    }
    
    func goFaw (){
        let six = sixTeenMenuViewController()
        self.present(six, animated: true) {
           
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let six = sixTeenMenuViewController()
//        self.present(six, animated: true) { 
//            self.navigationController?.isNavigationBarHidden = true
//        }
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
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
