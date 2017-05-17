//
//  SeventeenViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/17.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class SeventeenViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bottomView: UIView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(){
        let nibNameOrNib = String?("SeventeenViewController")
        self.init(nibName : nibNameOrNib ,bundle : nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        //添加键盘通知
        NotificationCenter.default.addObserver(self, selector: #selector(SeventeenViewController.keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func keyBoardWillShow(_ note:Notification)
    {
        let userinfo = note.userInfo
        let keyBounds = (userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userinfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let delyY = keyBounds.size.height
        let animations:(() -> Void) = {
            self.bottomView.transform = CGAffineTransform(translationX: 0, y: -delyY)
            self.textField.transform = CGAffineTransform(translationX: 0, y: -delyY)
        }
        
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue:UInt((userinfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: { 
                 animations()
            }, completion: { (finished) in
                
//                animations()
                
            })
        }else{
            
           
            
        }
        
        
    }
    
    func keyBoardWillHide(_ object:Notification){
        
        let userinfo = object.userInfo
      //  let keyBounds = (userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userinfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
//        let delyY = keyBounds.size.height
        let animations:(() -> Void) = {
            self.bottomView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.textField.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue:UInt((userinfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                animations()
            }, completion: { (finished) in
                
                //                animations()
                
            })
        }else{
            
            
            
        }
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
//        view.endEditing(true)
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
