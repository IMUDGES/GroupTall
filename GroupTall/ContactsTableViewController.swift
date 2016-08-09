//
//  ContactsTableViewController.swift
//  GroupTall
//
//  Created by Dule on 8/4/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts:Array<String> = []
    var conVC = UserInfoTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "cell")
            let query:BmobQuery = BmobQuery(className:"UserInfo")
            query.findObjectsInBackgroundWithBlock { (array, error) in
                for i in 0..<array.count{
                    let obj = array[i] as! BmobObject
                    // 从查询结果中获取手机号和密码
                    let bmob_nickName = obj.objectForKey("nickName") as? String
                    if let bmob_nickName = bmob_nickName {
                        self.contacts.append(bmob_nickName)
                        let indexPath = NSIndexPath(forRow:self.contacts.count-1,inSection:0)
                        self.tableView.insertRowsAtIndexPaths([indexPath],withRowAnimation:UITableViewRowAnimation.Automatic)
                    }
                }
                // bmob反馈错误提示
                if error != nil{
                    let errorInfo=error.localizedDescription
                    self.noticeOnlyText("Login Faild! \(errorInfo)", autoClear: true, autoClearTime: 1)
                    return
                }
//                for i in 0 ..< self.contacts.count{
//                    let indexPathDatePicker = NSIndexPath(forRow: i, inSection: 0)
//                    self.tableView.insertRowsAtIndexPaths([indexPathDatePicker],
//                        withRowAnimation: UITableViewRowAnimation.Automatic)
//                }
            }
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ContactCell
        configCell(cell,indexPath:indexPath)
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        conVC.title = contacts[indexPath.row]
        conVC.Tname = contacts[indexPath.row]
        conVC.TphoneNumber = "15247173231"
        self.performSegueWithIdentifier("ShowUserInfo", sender: self )
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true
        let desVC = segue.destinationViewController as? UserInfoTableViewController
        desVC?.title = self.conVC.title
        desVC?.Tname = self.conVC.Tname
        desVC?.TphoneNumber = self.conVC.TphoneNumber
        
    }
    
    func configCell(cell:ContactCell,indexPath:NSIndexPath){
        let contact = contacts[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: "contacts@2x.png")
        cell.nameLabel.text = contact
    }
}
