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
            UIAlertView(title: "Error", message: "Must be fill all the options.", delegate: self, cancelButtonTitle: "OK").show()
        }else{
            login(phoneNumber!, password: password!)
        }
    }
    override func viewDidLoad() {
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
                if phoneNumber==bmob_phoneNumber&&password==bmob_password{
                    print("Login Success!")
                    self.performSegueWithIdentifier("LoginSuccess", sender: self)
                    break
                }
            }
            if error != nil{
                let errorInfo=error.localizedDescription
                print("Login Faild! \(errorInfo)")
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
