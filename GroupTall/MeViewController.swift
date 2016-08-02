//
//  MeViewController.swift
//  GroupTall
//
//  Created by Dule on 8/1/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class MeViewController: UITableViewController {


    @IBAction func btnLogoutOnClicked(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject("", forKey:"phoneNumber")
        NSUserDefaults.standardUserDefaults().setObject("", forKey: "password")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.performSegueWithIdentifier("Logout", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
