//
//  TabbarViewController.swift
//  GroupTall
//
//  Created by Dule on 8/1/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class TabbarViewController: UIViewController {
    
    var homeVc:HomeViewController? = HomeViewController()
    func layoutUI() {
//        let _width = self.view.frame.width
//        let _height = self.view.frame.height - 50
//        
//        self.homeVc = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewControllerWithIdentifier("home_sid") as? UINavigationController
//        self.homeVc!.view.frame = CGRectMake(0, 0, _width, _height)
//        //注册controller
//        self.addChildViewController(self.homeVc!)
//        
//        self.discoverVc = UIStoryboard.init(name: "Discover", bundle: nil).instantiateViewControllerWithIdentifier("discover_sid") as? NavigationController
//        self.discoverVc!.view.frame = CGRectMake(0, 0, _width, _height)
//        self.addChildViewController(self.discoverVc!)
//        
//        self.messageVc = UIStoryboard.init(name: "Message", bundle: nil).instantiateViewControllerWithIdentifier("message_sid") as? NavigationController
//        self.messageVc!.view.frame = CGRectMake(0, 0, _width, _height)
//        self.addChildViewController(self.messageVc!)
//        
//        self.profileVc = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewControllerWithIdentifier("profile_sid") as? NavigationController
//        self.profileVc?.view.frame = CGRectMake(0, 0, _width, _height)
//        self.addChildViewController(self.profileVc!)
//        
//        self.view.addSubview(self.homeVc!.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self._btnHome.selected = true
        layoutUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
