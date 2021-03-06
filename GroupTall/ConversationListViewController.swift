//
//  ConversationListViewController.swift
//  GroupTall
//
//  Created by Dule on 8/2/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    
    // 中间变量，设置即将条转页面的信息时使用
    let conVC = RCConversationViewController()
    
    // 测试专用
    @IBAction func btnAddConversationOnClicked(sender: AnyObject) {
        conVC.targetId = "test"
        //conVC.userName = model.conversationTitle
        conVC.conversationType = .ConversationType_PRIVATE
        conVC.title = "测试用户"
        self.performSegueWithIdentifier("ConversationCellOnClicked", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 设置用最近聊天界面可显示的会话类型
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.connectServer({
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        })
        // 跳转到最近会话界面之前显示tabbar
        self.tabBarController?.tabBar.hidden = false
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        self.tabBarController?.tabBar.hidden = true
        let desVC = segue.destinationViewController as? RCConversationViewController
        desVC?.targetId = self.conVC.targetId
        desVC?.conversationType = self.conVC.conversationType
        desVC?.title = self.conVC.title
    }
    
    // 点击列表时设置将要条转页面的显示信息
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        conVC.targetId = model.targetId
        conVC.conversationType = .ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        performSegueWithIdentifier("ConversationCellOnClicked", sender: self)
    }
}
