//
//  MyNavigationViewController.swift
//  booooom
//
//  Created by Yuki Moriyama on 2015/01/09.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import UIKit

class MyNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
    
    //NavigationBar上の戻るボタンで戻るときに通ります
    override func popViewControllerAnimated(animated: Bool) -> UIViewController{
        
        let transition: CATransition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        
        self.view.layer.addAnimation(transition,forKey: kCATransition)
        return super.popViewControllerAnimated(false)!
    }
}