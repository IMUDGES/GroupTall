//
//  RegisterViewController.swift
//  GroupTall
//
//  Created by Dule on 7/29/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tf_phoneNumber: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_passwordRepet: UITextField!
    @IBAction func btnRegisterOnClicked(sender: AnyObject) {
        let phoneNumber=tf_phoneNumber.text
        let password=tf_password.text
        let passwordRepet=tf_passwordRepet.text
        if (phoneNumber == nil || password == nil || passwordRepet == nil || phoneNumber == "" || password == "" || passwordRepet == ""){
            //            let alertController = UIAlertController(title:"Error", message:"Must be fill all the options.", preferredStyle:UIAlertControllerStyle.Alert)
            //            let cancelAction = UIAlertAction(title:"Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            //            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler: nil)
            //            alertController.addAction(cancelAction)
            //            alertController.addAction(okAction)
            //            self.presentViewController(alertController, animated:true, completion: nil)
            //FIXME: Change style to support ios 9.0
            UIAlertView(title: "Error", message: "Must be fill all the options.", delegate: self, cancelButtonTitle: "OK").show()
        }else if(password! != passwordRepet!){
            //FIXME: Change style to support ios 9.0
            UIAlertView(title: "Error", message: "Password repet is not same as password.", delegate: self, cancelButtonTitle: "OK").show()
        }else{
            self.register(phoneNumber!,password:password!)
        }
    }
    func register(phoneNumber:String,password:String){
        let registerInfo:Dictionary<String,String>=["phoneNumber":phoneNumber,"password":password]
        let bmob:BmobObject=BmobController.insert("UserInfo", insertInfo: registerInfo)
        bmob.saveInBackgroundWithResultBlock { (isSuccessful, error) in
            if error != nil{
                let errorInfo=error.localizedDescription
                // FIXME: Change style to support ios 9.0
                UIAlertView(title: "Error", message: "Register Faild! \(errorInfo)", delegate: self, cancelButtonTitle: "OK").show()
            }else{
                //设置存储信息
                NSUserDefaults.standardUserDefaults().setObject(phoneNumber, forKey:"phoneNumber")
                NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.performSegueWithIdentifier("Back", sender: self)
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
