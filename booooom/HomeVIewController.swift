//
//  HomeVIewController.swift
//  booooom
//
//  Created by Yuki Moriyama on 2015/01/09.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cameraBtn: UIButton!
    
    var scrollBeginingPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // table delegate
        tableView.delegate = self
        tableView.dataSource = self

        // navigation main title settings
        var nav = self.navigationController?.navigationBar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        let image = UIImage(named: "BoooM_logo")
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
        
        // navigation
        let rightSearchBtn = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "barButtonItemClicked:")
        rightSearchBtn.tintColor = UIColor(red:0.773,green:0.525,blue:0.820,alpha:1.0)
        
        navigationItem.setRightBarButtonItem(rightSearchBtn, animated: true)
        
    }
    
    func barButtonItemClicked(sender: AnyObject?){
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        
        performSegueWithIdentifier("ItemDitail",sender: nil)
        
        // error
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as UITableViewCell
        
        // only cell
        let itemImageView = cell.contentView.viewWithTag(7) as UIImageView
        let nameLabel = cell.contentView.viewWithTag(2) as UILabel
        let userName = cell.contentView.viewWithTag(3) as UILabel
        
        itemImageView.image = UIImage(named: "sample.jpg")
        itemImageView.clipsToBounds = true
        
        switch indexPath.row {
        case 0:
            nameLabel.text = "Pretty Chair"
            userName.text = "Masamitsu Konya"
            itemImageView.image = UIImage(named: "sample-chair.jpg")
            break
        case 1:
            nameLabel.text = "Dinamic Chair"
            userName.text = "Masamitsu Konya"
            itemImageView.image = UIImage(named: "sample-chair-2.jpg")
            break
        case 2:
            nameLabel.text = "Cool Chair"
            userName.text = "Masamitsu Konya"
            itemImageView.image = UIImage(named: "sample-chair3.jpg")
            break
        case 3:
            nameLabel.text = "Lego"
            userName.text = "Masamitsu Konya"
            break
        default:
            break
        }
        
        
        //userNameLabel.text = userNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginingPoint = scrollView.contentOffset;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var currentPoint = scrollView.contentOffset;
        if(scrollBeginingPoint.y < currentPoint.y){
            println("下へスクロール")
            
            
        }else{
            println("上へスクロール")
        }
    }
    
    @IBAction func toFormController(sender: AnyObject) {
        performSegueWithIdentifier("toForm",sender: nil)
    }

}
