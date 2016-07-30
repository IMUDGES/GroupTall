//
//  LoginViewController.swift
//  GroupTall
//
//  Created by Dule on 7/29/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tf_phoneNumber: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBAction func btnLoginOnClicked(sender: AnyObject) {
        let phoneNumber = tf_phoneNumber.text
        let password = tf_password.text
        if(phoneNumber == nil || password == nil || phoneNumber == "" || password == ""){
            //FIXME: Change style to support ios 9.0
            UIAlertView(title: "Error", message: "Must be fill all the options.", delegate: self, cancelButtonTitle: "OK").show()
        }else{
            login(phoneNumber!, password: password!)
        }
    }
    override func viewDidLoad() {
        //读取上次配置
        self.tf_phoneNumber.text = NSUserDefaults.standardUserDefaults().valueForKey("phoneNumber") as? String
        self.tf_password.text = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String
        login(tf_phoneNumber.text!, password: tf_password.text!)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func login(phoneNumber:String,password:String){
        let query:BmobQuery = BmobQuery(className:"UserInfo")
        query.findObjectsInBackgroundWithBlock { (array, error) in
            for i in 0..<array.count{
                let obj = array[i] as! BmobObject
                let bmob_phoneNumber = obj.objectForKey("phoneNumber") as? String
                let bmob_password = obj.objectForKey("password") as? String
                if phoneNumber==bmob_phoneNumber {
                    if password==bmob_password {
                        //print("Login Success!")
                        let StrPhoneNumberKey:String = "phoneNumber"
                        let StrPasswordKey:String = "password"
                        //设置存储信息
                        NSUserDefaults.standardUserDefaults().setObject(phoneNumber, forKey:StrPhoneNumberKey)
                        NSUserDefaults.standardUserDefaults().setObject(password, forKey: StrPasswordKey)
                        //设置同步
                        NSUserDefaults.standardUserDefaults().synchronize()
                        self.performSegueWithIdentifier("LoginSuccess", sender: self)
                        return
                    }else{
                        //FIXME: Change style to support ios 9.0
                        UIAlertView(title: "Error", message: "Password wrong!", delegate: self, cancelButtonTitle: "OK").show()
                        return
                    }
                }
            }
            if error != nil{
                let errorInfo=error.localizedDescription
                //FIXME: Change style to support ios 9.0
                UIAlertView(title: "Error", message: "Login Faild! \(errorInfo)", delegate: self, cancelButtonTitle: "OK").show()
                return
            }else{
                //FIXME: Change style to support ios 9.0
                UIAlertView(title: "Error", message: "Phone number not found!", delegate: self, cancelButtonTitle: "OK").show()
                return
            }
        }
        
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
