//
//  sixMenuManager.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/5/10.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit

class sixMenuManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate{

    fileprivate var presenting = false
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        let container = transitionContext.containerView
        let screens : (from: UIViewController ,to: UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!,transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !presenting ? screens.from as! sixTeenMenuViewController : screens.to as! sixTeenMenuViewController
        let bottomViewController = !presenting ? screens.to as UIViewController : screens.to as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if self.presenting {
            
        self.offStageMenuController(menuViewController)
            
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
 
       let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.8, options: [], animations: {
            
            if self.presenting {
                self.onStageMenuController(menuViewController)
                
            }else{
                self.offStageMenuController(menuViewController)
            }
            
            
        },completion:{ finished in
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(screens.to.view)
            
        })
        
    }
        func offstage(_ amount: CGFloat) -> CGAffineTransform{
            return CGAffineTransform(translationX: amount, y: 0)
        }
        
        func offStageMenuController(_ menuViewController: sixTeenMenuViewController){
            menuViewController.view.alpha = 0
            let topRowOffset:CGFloat = 300
            let middleRowOffset : CGFloat = 150
            let bottomRowOffset :CGFloat  = 50
            
            menuViewController.oneButton.transform =  offstage(-topRowOffset)
            
            menuViewController.twoButton.transform = offstage(topRowOffset)
            
            menuViewController.threeButton.transform = offstage(-middleRowOffset)
            
            menuViewController.fourButton.transform = offstage(middleRowOffset)
            
            menuViewController.fiveButton.transform = offstage(-bottomRowOffset)
            
            menuViewController.sixButton.transform = offstage(bottomRowOffset)
            
            
        }
        
        
        func onStageMenuController(_ menuViewController: sixTeenMenuViewController){
            menuViewController.view.alpha = 1
            
            menuViewController.oneButton.transform = CGAffineTransform.identity
            menuViewController.twoButton.transform = CGAffineTransform.identity
            menuViewController.threeButton.transform = CGAffineTransform.identity
            menuViewController.fourButton.transform = CGAffineTransform.identity
            menuViewController.fiveButton.transform = CGAffineTransform.identity
            menuViewController.sixButton.transform = CGAffineTransform.identity
            
        }
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = true
        return self
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
    

        
        
    }
    
    
    
    
    
    
    
    
    
    

