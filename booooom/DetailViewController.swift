//
//  DetailViewController.swift
//  booooom
//
//  Created by Yuki Moriyama on 2015/01/09.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import Foundation
import Uikit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let mySections: NSArray = ["", "Material", "How To Use"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return mySections.count
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        // error
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellName: String

        switch indexPath.section {
        case 0:
            cellName = "First Cell"
            break
        case 1:
            cellName = "Material Cell"
            break
        case 2:
            cellName = "How To Use"
            break
        default:
            cellName = ""
            break
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath) as UITableViewCell
        
        // only cell
        if(cellName == "First Cell"){
            let itemImageView = cell.contentView.viewWithTag(7) as UIImageView
            
            itemImageView.image = UIImage(named: "sample.jpg")
            itemImageView.clipsToBounds = true
        }
        
        //userNameLabel.text = userNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
