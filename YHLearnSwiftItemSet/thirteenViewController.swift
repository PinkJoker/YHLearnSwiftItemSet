//
//  thirteenViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/24.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class thirteenViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    public  var emojiPk:UIPickerView?
    var goButton:UIButton?
    var resultLabel:UILabel?
    
    public var imageArray:[String] = Array()
    public var dataArray:[Int] = Array()
    public var dataArray2:[Int] = Array()
    public var dataArray3:[Int] = Array()
    public var bounds:CGRect = CGRect.zero
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        emojiPk = UIPickerView.init(frame: CGRect(x: 0, y: 200, width: kWidth , height: 200))
        view.addSubview(emojiPk!)
        emojiPk?.delegate = self
        emojiPk?.dataSource = self
        
        goButton = UIButton(type: .custom)
        view.addSubview(goButton!)
        goButton?.frame = CGRect(x: 40, y: 450, width: kWidth - 80, height: 44)
        goButton?.backgroundColor = UIColor.magenta
        goButton?.addTarget(self, action: #selector(touchGO), for: .touchDown)
        goButton?.setTitle("抽奖", for:.normal)
        goButton?.layer.cornerRadius = 5
        resultLabel = UILabel(frame: CGRect(x: 40, y: 510, width: kWidth - 80, height: 20))
        resultLabel?.textAlignment = .center
        resultLabel?.textColor = UIColor.white
        view.addSubview(resultLabel!)
        
        
        bounds = (goButton?.bounds)!
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0..<100 {
            dataArray.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
        
        resultLabel?.text = ""

        // Do any additional setup after loading the view.
    }
    // 转盘游戏
    func touchGO(){
        emojiPk?.selectRow(Int(arc4random()%90 + 3), inComponent: 0, animated: true)
        emojiPk?.selectRow(Int(arc4random()%90 + 3), inComponent: 1, animated: true)
         emojiPk?.selectRow(Int(arc4random()%90 + 3), inComponent: 2, animated: true)
        
        if (dataArray[(emojiPk?.selectedRow(inComponent: 0))!] == dataArray2[(emojiPk?.selectedRow(inComponent: 1))!]  && dataArray[(emojiPk?.selectedRow(inComponent: 0))!] == dataArray3[(emojiPk?.selectedRow(inComponent: 2))!]){
            resultLabel?.text = "Bingo!"
        }else{
            resultLabel?.text = "boom!"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .curveEaseIn, animations: { 
            
        }) { (complete:Bool) in
            
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 03, options: .curveEaseIn, animations: { 
            self.goButton?.alpha = 1
        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension thirteenViewController{
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kWidth * 0.3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80.0
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray[row])]
        }else if component == 1{
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        }else{
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = .center
        return pickerLabel
    }

    
    
}


