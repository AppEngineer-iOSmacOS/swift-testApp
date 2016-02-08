//
//  ViewControllerNext2.swift
//  TestfulApp
//
//  Created by Nikolay Sozinov on 08.02.16.
//  Copyright © 2016 Nikolay Sozinov. All rights reserved.
//

import UIKit

class ViewControllerNext2: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var _items:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let bnd:NSBundle = NSBundle.mainBundle()
        let prs:NSString = bnd.pathForResource("data",ofType:"plist")!
        // Plist -> NSArray
        _items = NSArray(contentsOfFile:prs as String)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return _items.count    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:MyTableCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MyTableCell
        
        //  NSArray -> NSDictionary
        let dic:NSDictionary = _items.objectAtIndex(indexPath.row) as! NSDictionary
        print(" Plist:\(dic)")
        
        
        let FullName:NSString = dic["fullname"]! as! NSString
        let Message:NSString = dic["message"]! as! NSString
        let SendingDate:NSDate = dic["sendingDate"]! as! NSDate
        let UnreadMessagesCount:Int = dic["unreadMessagesCount"]! as! Int
        
      let AvatarURL:NSString = dic["avatarURL"]! as! NSString

        
        
        if let labelfullName = cell.fullname{
            labelfullName.text = FullName as String
        }
        if let labelMessage = cell.message{
            labelMessage.text = Message as String
        }

        if let labelUnreadMessagesCount = cell.unreadMessagesCount{
            let myString = String(UnreadMessagesCount)
            labelUnreadMessagesCount.text = "+ \(myString) messages" as String
        }
        
        if let labelSendingDate = cell.sendingDate{
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
            let dateString = dateFormatter.stringFromDate(SendingDate)
            labelSendingDate.text = dateString as String
        }
        
        
        if AvatarURL .isEqual("") {
            let imageName = "noavatar"
         cell.avatarImage.image = UIImage(named: imageName)
        } else
        
        if let cellImage : UIImage = UIImage(data: NSData(contentsOfURL: NSURL(string:AvatarURL as String)!)!){
        cell.avatarImage.image = cellImage;
        }
        
        return cell
    }
    
    
}
