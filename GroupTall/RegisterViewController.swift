//
//  RegisterViewController.swift
//  GroupTall
//
//  Created by Dule on 7/29/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // 关联控件
    @IBOutlet weak var btn_Register: RoundButton!
    @IBOutlet weak var tf_phoneNumber: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_passwordRepet: UITextField!
    // 设置注册按钮事件
    @IBAction func btnRegisterOnClicked(sender: AnyObject) {
        let phoneNumber=tf_phoneNumber.text
        let password=tf_password.text
        guard FormIsRight() else {
            return
        }
        self.register(phoneNumber!,password:password!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.noticeTopRed("Success!")
//        self.clearAllNotice() // clear
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 设置注册键不可用
//        self.btn_Register.enabled = false
//        self.btn_Register.backgroundColor = UIColor.grayColor()
//        self.btn_Register.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 注册
    func register(phoneNumber:String,password:String){
        let registerInfo:Dictionary<String,String>=["phoneNumber":phoneNumber,"password":password]
        //创建bmob对象并且查询表UserInfo
        let bmob:BmobObject=BmobController.insert("UserInfo", insertInfo: registerInfo)
        bmob.saveInBackgroundWithResultBlock { (isSuccessful, error) in
            if error != nil{
                let errorInfo=error.localizedDescription
                self.noticeOnlyText("Register Faild! \(errorInfo)", autoClear: true, autoClearTime: 1)
            }else{
                //设置存储信息
                NSUserDefaults.standardUserDefaults().setObject(phoneNumber, forKey:"phoneNumber")
                NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.performSegueWithIdentifier("Back", sender: self)
            }
        }
    }
    
    //验证表单的正确性
    func FormIsRight()-> Bool {
        // 从界面获取信息
        let phoneNumber=tf_phoneNumber.text
        let password=tf_password.text
        let passwordRepet=tf_passwordRepet.text
        
        // 确保所有信息都不为空，以方便在后面调用
        guard phoneNumber != nil && password != nil && passwordRepet != nil && phoneNumber != "" && password != "" && passwordRepet != "" else {
            self.noticeOnlyText("Must be fill all the options.", autoClear: true, autoClearTime: 1)
            return false
        }
        // 检查手机号是否合法
        let phoneNumberRegex = "1[3|4|5|7|8][0-9]{9}"
        let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        guard phoneNumberPredicate.evaluateWithObject(phoneNumber) else {
            self.noticeOnlyText("Phone number is wrong", autoClear: true, autoClearTime: 1)
            return false
        }
        
        // 查询手机号是否已经注册
        // FIXME: 查询操作的线程影响问题
        var phoneNumberExist = false
        let query:BmobQuery = BmobQuery(className:"UserInfo")
        query.findObjectsInBackgroundWithBlock { (array, error) in
            for i in 0..<array.count{
                let obj = array[i] as! BmobObject
                let bmob_phoneNumber = obj.objectForKey("phoneNumber") as? String
                print(phoneNumber!)
                print(bmob_phoneNumber!)
                if phoneNumber! == bmob_phoneNumber! {
                    print("has")
                    phoneNumberExist = true
                    return
                }
            }
        }
        if phoneNumberExist  {
            self.noticeOnlyText("PhoneNumber exist!", autoClear: true, autoClearTime: 1)
            return false
        }
        
        // 检查密码是否符合规则：由数字、字母、下划线组成，并且是6-18位
        let passwordRegex = "[0-9a-zA-Z_]{6,18}"
        let PasswordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard PasswordPredicate.evaluateWithObject(password) else {
            self.noticeOnlyText("password must be maded by character , underline  or number and lenght in 6 - 18.", autoClear: true, autoClearTime: 1)
            return false
        }
        
        // 检查密码与重复密码是否一样
        guard password! == passwordRepet! else {
            self.noticeOnlyText("Password repet is not same as password.", autoClear: true, autoClearTime: 1)
            return false
        }

        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //触摸非输入区隐藏键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    //手机号输入框的return事件设置为隐藏键盘
    @IBAction func DoneCloseKeyBord(sender: AnyObject) {
        tf_phoneNumber.resignFirstResponder();
    }
    //密码输入框的return事件设置为隐藏键盘
    @IBAction func DoneEditPasswordAndCloseKeyBord(sender: AnyObject) {
        tf_password.resignFirstResponder()
    }
    //密码重复输入框的return事件设置为隐藏键盘
    @IBAction func DoneEditPasswordRepetEditAndCloseKeyBord(sender: AnyObject) {
        tf_passwordRepet.resignFirstResponder()
    }
}
