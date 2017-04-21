//
//  nineViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/21.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

let kWidth = UIScreen.main.bounds.size.width
let kHeight = UIScreen.main.bounds.size.height
class nineViewController: UIViewController,UIScrollViewDelegate {

    var bgImageView = UIImageView()
    var effectView = UIVisualEffectView()
  open  var imageView:UIImageView?
  open  var scrollView:UIScrollView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.frame = CGRect(x: 0, y: 64, width: kWidth, height: kHeight)
        view.addSubview(bgImageView)
        bgImageView.image = UIImage(named: "desk_005.jpg")
      
        let effect = UIBlurEffect(style: .dark)
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 0, y: 0, width: kWidth, height: kHeight-64)
        bgImageView.addSubview(effectView)
        
        imageView = UIImageView(image: UIImage(named: "meilv.jpg"))

        scrollView = UIScrollView()
       // scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight - 64))
        scrollView?.delegate = self
        scrollView?.zoomScale = (scrollView?.minimumZoomScale)!
        
        setUpScrollView()
        setZoomScaleFor((scrollView?.bounds.size)!)
        scrollView?.zoomScale = (scrollView?.minimumZoomScale)!
        
        recenterImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setZoomScaleFor((scrollView?.bounds.size)!)
        if (scrollView?.zoomScale)! < (scrollView?.maximumZoomScale)! {
            scrollView?.zoomScale = (scrollView?.minimumZoomScale)!
        }
        recenterImage()
    }

}

extension nineViewController{
    fileprivate func setUpScrollView(){
        scrollView = UIScrollView(frame: view.bounds)
        scrollView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        scrollView?.backgroundColor = UIColor.clear
        scrollView?.contentSize = (imageView?.bounds.size)!
        
        scrollView?.addSubview(imageView!)
        view.addSubview(scrollView!)
    }
    
    fileprivate func setZoomScaleFor(_ scrollViewSize:CGSize){
        let imageSize = imageView?.bounds.size
        let widthScale = scrollViewSize.width / (imageSize?.width)!
        let heightScale = scrollViewSize.height / (imageSize?.height)!
        let minimumScale = min(widthScale, heightScale)
        scrollView?.minimumZoomScale = minimumScale
        scrollView?.maximumZoomScale = 2.0
    }
    
    func recenterImage(){
        let scrollViewSize = scrollView?.bounds.size
        let imageViewSize = imageView?.frame.size
        let horizontalSpace = (imageViewSize?.width)! < (scrollViewSize?.width)! ? ((scrollViewSize?.width)! - (imageViewSize?.width)!) / 2.0 : 0
        let verticalSpace = (imageViewSize?.height)! < (scrollViewSize?.height)! ? ((scrollViewSize?.height)! - (imageViewSize?.width)!) / 2.0 : 0
        scrollView?.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
            recenterImage()
    }
    
    
    
    
}




