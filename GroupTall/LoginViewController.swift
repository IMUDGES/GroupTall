//
//  LoginViewController.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/6/30.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var tf_pnum: UITextField!
    @IBOutlet weak var tf_pwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginOnClicked(sender: AnyObject) {
        let phoneNumber=tf_pnum.text
        let passWord=tf_pwd.text
        let bl=BL()
        bl.login(phoneNumber!, passWord: passWord!)
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
