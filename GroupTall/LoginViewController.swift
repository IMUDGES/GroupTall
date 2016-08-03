//
//  LoginViewController.swift
//  GroupTall
//
//  Created by Dule on 7/29/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // 关联控件
    @IBOutlet weak var tf_phoneNumber: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    // 设置登录按钮事件
    @IBAction func btnLoginOnClicked(sender: AnyObject) {
        let user=User(phoneNumber: tf_phoneNumber.text , password: tf_password.text)
        if(user.getPhoneNumber() == nil || user.getPassword() == nil || user.getPhoneNumber() == "" || user.getPassword() == ""){
            self.noticeOnlyText("Must be fill all the options.", autoClear: true, autoClearTime: 1)
        }else{
            login(user)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //获取应用目录
        //        let path=NSHomeDirectory()
        //        print(path)
    }
    override func viewDidAppear(animated: Bool) {
        // 获取本地存储设置到登录界面上的相应TextField里面并且跳转到成功登陆页面
        tf_phoneNumber.text = NSUserDefaults.standardUserDefaults().valueForKey("phoneNumber") as? String
        tf_password.text = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String
        let phoneNumber = NSUserDefaults.standardUserDefaults().valueForKey("phoneNumber") as? String
        let password = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String
        // 如果本地没有存储的数据则不跳转
        if(phoneNumber != nil && password != nil && phoneNumber != "" && password != ""){
            self.performSegueWithIdentifier("LoginSuccess", sender: self )
        }
    }
    
    // 登录
    internal func login(user:User){
        // 创建bmob对象并且查询表UserInfo
        let query:BmobQuery = BmobQuery(className:"UserInfo")
        query.findObjectsInBackgroundWithBlock { (array, error) in
            for i in 0..<array.count{
                let obj = array[i] as! BmobObject
                // 从查询结果中获取手机号和密码
                let bmob_phoneNumber = obj.objectForKey("phoneNumber") as? String
                let bmob_password = obj.objectForKey("password") as? String
                if user.getPhoneNumber() == bmob_phoneNumber {
                    if user.getPassword() == bmob_password {
                        // 将用户登录信息存储到本地
                        NSUserDefaults.standardUserDefaults().setObject(user.getPhoneNumber(), forKey: "phoneNumber")
                        NSUserDefaults.standardUserDefaults().setObject(user.getPassword(), forKey: "password") 
                        NSUserDefaults.standardUserDefaults().synchronize()
                        self.performSegueWithIdentifier("LoginSuccess", sender: self )
                        return
                    }else{
                        // 密码错误提示
                        self.noticeOnlyText("Password wrong!", autoClear: true, autoClearTime: 1)
                        return
                    }
                }
            }
            // bmob反馈错误提示
            if error != nil{
                let errorInfo=error.localizedDescription
                self.noticeOnlyText("Login Faild! \(errorInfo)", autoClear: true, autoClearTime: 1)
                return
            }
            // 用户不存在提示
            else{
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
    
    // 触摸非输入区隐藏键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    // 手机号输入框的return事件设置为隐藏键盘
    @IBAction func DoneEditPhoneNumberAndCloseKeyBord(sender: AnyObject) {
        tf_phoneNumber.resignFirstResponder()
    }
    // 密码输入框的return事件设置为隐藏键盘
    @IBAction func DoneEditPasswordAndCloseKeyBord(sender: AnyObject) {
        tf_password.resignFirstResponder()
    }

}
