//
//  twelveViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/24.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit


class twelveViewController: UIViewController {

    var topImageView:UIImageView?
    var loginButton:UIButton?
    var signUpButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        topImageView = UIImageView(frame: CGRect(x:self.view.center.x - 90, y: 100, width: 180, height: 80))
        view.addSubview(topImageView!)
        topImageView?.image = UIImage(named: "Image")
        loginButton = UIButton(frame: CGRect(x: 30, y: kHeight - 64, width: kWidth - 60, height: 44))
        view.addSubview(loginButton!)
        loginButton?.backgroundColor = UIColor.red
        loginButton?.setTitle("login", for: .normal)
        loginButton?.setTitleColor(UIColor.white, for: .normal)
        signUpButton = UIButton(frame: CGRect(x: 30, y: kHeight - 118, width: kWidth - 60, height: 44))
        view.addSubview(signUpButton!)
        signUpButton?.backgroundColor = UIColor.white
        signUpButton?.setTitle("sign up", for: .normal)
        signUpButton?.setTitleColor(UIColor.black, for: .normal)
        
        loginButton?.addTarget(self, action: #selector(touchLoginButton), for: .touchDown)
        // Do any additional setup after loading the view.
    }
    
    
    func touchLoginButton(){
        let animationVC = animationViewController()
        present(animationVC, animated: true, completion: nil)
//        navigationController?.pushViewController(animationVC, animated: true)
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
