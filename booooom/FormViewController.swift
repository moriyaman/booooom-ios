//
//  FormViewController.swift
//  booooom
//
//  Created by Yuki Moriyama on 2015/01/08.
//  Copyright (c) 2015年 yuki.moriyama. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var cameraBtn1: UIButton!
    
    @IBOutlet weak var cameraBtn: UIButton!
    var picker:UIImagePickerController!=UIImagePickerController()
    var popover:UIPopoverController!=nil
    let mySections: NSArray = ["", "Name", "Introduce", "Category", ""]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return mySections.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        // error
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellName: String
        
        switch indexPath.section {
        case 0:
            cellName = "Photo Cell"
            break
        case 1:
            cellName = "Text Field Cell"
            break
        case 2:
            cellName = "Text Field Cell"
            break
        case 3:
            cellName = "Select Cell"
            break
        case 4:
            cellName = "Finish Cell"
            break
        default:
            cellName = ""
            break
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath) as UITableViewCell
        
        switch indexPath.section {
        case 0:
            let cameraBtn = cell.viewWithTag(1) as UIButton
            let cameraImage = cell.viewWithTag(2) as UIImageView
            cameraBtn.addTarget(self, action: "cameraBtnClicked:", forControlEvents:.TouchUpInside)
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
        
        //let userNameLabel = cell.viewWithTag(1) as UILabel
        //userNameLabel.text = userNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var cellNum: Int
        
        switch section {
        case 0:
            cellNum = 1
            break
        case 1:
            cellNum = 3
            break
        case 2:
            cellNum = 3
            break
        case 3:
            cellNum = 3
            break
        case 4:
            cellNum = 1
            break
        default:
            cellNum = 0
            break
        }

        return cellNum
    }
    
    @IBAction func cameraBtnClicked(sender: AnyObject) {
        var alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.openCamera()
        }
        
        var gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.openGallary()
        }
        
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
        }
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        
        // シュミレータだと開かないように
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            println("aaaa")
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func openGallary() {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let indexPath = NSIndexPath(forRow:0, inSection:0)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let imageView = cell?.viewWithTag(2) as UIImageView
        imageView.image=info[UIImagePickerControllerOriginalImage] as UIImage
        //sets the selected image to image view
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        println("picker cancel.")
    }
    
    @IBAction func closeBtnClicked(sender: AnyObject) {
        
        var alert:UIAlertController = UIAlertController(title: "Confirm", message: "ゼンブキエチャウケドオーケー？", preferredStyle: UIAlertControllerStyle.Alert)
        
        //Cancel 一つだけしか指定できない
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("Cancel")
                self.openCamera()
        })
        
        //Default 複数指定可
        let okAction:UIAlertAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                self.dismissViewControllerAnimated(true, completion:nil)
        })
        
        //AlertもActionSheetも同じ
        alert.addAction(cancelAction)
        alert.addAction(okAction)

        presentViewController(alert, animated: true, completion: nil)
    }
    
}


