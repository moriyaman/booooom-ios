//
//  HomeVIewController.swift
//  booooom
//
//  Created by Yuki Moriyama on 2015/01/09.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import Uikit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var nav = self.navigationController?.navigationBar
        //nav?.barStyle = UIBarStyle.Black
    
        let rightSearchBtn = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "barButtonItemClicked:")
        rightSearchBtn.tintColor = UIColor(red:0.197,green:0.134,blue:0.209,alpha:1.0)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "BoooM_logo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        navigationItem.setRightBarButtonItem(rightSearchBtn, animated: true)
        
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func barButtonItemClicked(sender: AnyObject?){
        
    }
}
