//
//  ViewController.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/6/22.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var act_Ind: UIActivityIndicatorView!
    @IBOutlet weak var tx_phoneNumber: UITextField!
    @IBOutlet weak var tx_Password: UITextField!
    @IBOutlet weak var tx_rePassword: UITextField!
    @IBAction func btnRegisterOnClicked(sender: AnyObject) {
        act_Ind.startAnimating()
        let pnum=tx_phoneNumber.text
        let pswd=tx_Password.text
        let rpswd=tx_rePassword.text
        if pnum==nil||pswd==nil {
            UIAlertView(title: "错误", message: "密码或手机号不能为空", delegate: self, cancelButtonTitle: "确定").show()
            self.act_Ind.stopAnimating()
        }else{
            if pswd != rpswd {
                UIAlertView(title: "错误", message: "俩次输入的密码不一致", delegate: self, cancelButtonTitle: "确定").show()
                self.act_Ind.stopAnimating()
            }else{
                let bl=BL()
                bl.register(pnum!, passWord: pswd!)
                self.act_Ind.stopAnimating()
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //创建方法
}

