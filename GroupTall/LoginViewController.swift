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
        let user=User(phoneNumber: tf_phoneNumber.text , password: tf_password.text)
        if(user.getPhoneNumber() == nil || user.getPassword() == nil || user.getPhoneNumber() == "" || user.getPassword() == ""){
            self.noticeOnlyText("Must be fill all the options.", autoClear: true, autoClearTime: 1)
        }else{
            login(user)
        }
    }
    override func viewDidLoad() {
//        let path=NSHomeDirectory()
//        print(path)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        tf_phoneNumber.text = NSUserDefaults.standardUserDefaults().valueForKey("phoneNumber") as? String
        tf_password.text = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String
        let phoneNumber = NSUserDefaults.standardUserDefaults().valueForKey("phoneNumber") as? String
        let password = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String
        if(phoneNumber != nil && password != nil && phoneNumber != "" && password != ""){
            self.performSegueWithIdentifier("LoginSuccess", sender: self )
            //login(User(phoneNumber: phoneNumber, password: password))
        }
    }
    internal func login(user:User){
        let query:BmobQuery = BmobQuery(className:"UserInfo")
        query.findObjectsInBackgroundWithBlock { (array, error) in
            for i in 0..<array.count{
                let obj = array[i] as! BmobObject
                let bmob_phoneNumber = obj.objectForKey("phoneNumber") as? String
                let bmob_password = obj.objectForKey("password") as? String
                if user.getPhoneNumber() == bmob_phoneNumber {
                    if user.getPassword() == bmob_password {
                        //设置存储信息
                        NSUserDefaults.standardUserDefaults().setObject(user.getPhoneNumber(), forKey: "phoneNumber")
                        NSUserDefaults.standardUserDefaults().setObject(user.getPassword(), forKey: "password") 
                        NSUserDefaults.standardUserDefaults().synchronize()
                        self.performSegueWithIdentifier("LoginSuccess", sender: self )
                        return
                    }else{
                        self.noticeOnlyText("Password wrong!", autoClear: true, autoClearTime: 1)
                        return
                    }
                }
            }
            if error != nil{
                let errorInfo=error.localizedDescription
                self.noticeOnlyText("Login Faild! \(errorInfo)", autoClear: true, autoClearTime: 1)
                return
            }else{
                self.noticeOnlyText("Phone number not found!", autoClear: true, autoClearTime: 1)
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
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func DoneEditPhoneNumberAndCloseKeyBord(sender: AnyObject) {
        tf_phoneNumber.resignFirstResponder()
    }
    
    @IBAction func DoneEditPasswordAndCloseKeyBord(sender: AnyObject) {
        tf_password.resignFirstResponder()
    }

}
