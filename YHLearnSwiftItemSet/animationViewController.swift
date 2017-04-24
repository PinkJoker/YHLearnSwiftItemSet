//
//  animationViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/24.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class animationViewController: UIViewController {

    var nameTextField:UITextField?
    var passWordTextField:UITextField?
    var titleLabel:UILabel?
    var login:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        
        nameTextField = UITextField(frame: CGRect(x:  -kWidth - 60, y: 80, width: kWidth - 60, height: 44))
        view.addSubview(nameTextField!)
        nameTextField?.backgroundColor = UIColor.white
        nameTextField?.placeholder = "name"
//        nameTextField?.layer.cornerRadius = 5
//        nameTextField?.clipsToBounds = true
        passWordTextField = UITextField(frame: CGRect(x:  -kWidth - 60, y: 134, width: kWidth - 60, height: 44))
        view.addSubview(passWordTextField!)
        passWordTextField?.backgroundColor = UIColor.white
        passWordTextField?.placeholder = "password"
//        passWordTextField?.layer.cornerRadius = 6
//        passWordTextField?.clipsToBounds = true
        
        login = UIButton(frame: CGRect(x: 80, y: 204, width: kWidth - 160, height: 44))
        view.addSubview(login!)
        login?.backgroundColor = UIColor.brown
        login?.setTitle("login", for: .normal)
        login?.addTarget(self, action: #selector(touchLogin), for: .touchDown)
        login?.alpha = 0.0
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 400, width: kWidth, height: 30))
        view.addSubview(titleLabel!)
        titleLabel?.text = "点击任意空白处返回"
        titleLabel?.textColor = UIColor.white
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0.00, options: .curveEaseOut, animations: {
            self.nameTextField?.frame = CGRect(x: 30, y: 80, width: kWidth - 60, height: 44)
//            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.10, options: .curveEaseOut, animations: {
            self.passWordTextField?.frame = CGRect(x: 30, y: 134, width: kWidth - 60, height: 44)
//            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: { 
            self.login?.alpha = 1.0
            
        }, completion: nil)
        
        
        
    }
    
    func touchLogin(){
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveLinear, animations: {
            self.login?.frame = CGRect(x: 80-15, y: 204, width: kWidth - 160+30, height: 44)
            self.login?.isEnabled = false
        }, completion:{(true) in
//            self.login?.frame = CGRect(x: 80, y: 204, width: kWidth - 160, height: 44)
//            self.login?.isEnabled = true
        })
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveLinear, animations: {
            self.login?.frame = CGRect(x: 80, y: 204, width: kWidth - 160, height: 44)
//            self.login?.isEnabled = false
        }, completion:{(true) in
             self.login?.isEnabled = true
            //            self.login?.frame = CGRect(x: 80, y: 204, width: kWidth - 160, height: 44)
            //            self.login?.isEnabled = true
        })
        
//        UIView.animateKeyframes(withDuration: 0, delay: 0, options: UIViewKeyframeAnimationOptions(rawValue: 0), animations: true) { (true) in
//            
//        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
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
