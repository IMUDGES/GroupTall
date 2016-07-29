//
//  BL.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/6/30.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import Foundation
class BL {
    var dao=DAO.sharedInstance
    func register(phoneNumber:String,passWord:String){
        let registerInfo:Dictionary<String,String>=["PhoneNumber":phoneNumber,"PassWord":passWord]
        let bmob:BmobObject=dao.insert("UserInfo", insertInfo: registerInfo)
        bmob.saveInBackgroundWithResultBlock { (isSuccessful, error) in
            if error != nil{
                let errorInfo=error.localizedDescription
                 UIAlertView(title: "失败", message: "注册失败\(errorInfo)", delegate: self, cancelButtonTitle: "确定").show()
            }else{
                 UIAlertView(title: "成功", message: "注册成功", delegate: self, cancelButtonTitle: "确定").show()
            }
        }
    }
    func login(phoneNumber:String,passWord:String)
    {

        let query:BmobQuery = BmobQuery(className:"UserInfo")
        var isSuccess=false
        query.findObjectsInBackgroundWithBlock { (array, error) in
            for i in 0..<array.count{
                
                let obj = array[i] as! BmobObject
                let pn = obj.objectForKey("PhoneNumber") as? String
                let pw = obj.objectForKey("PassWord") as? String
                if phoneNumber==pn&&passWord==pw{
                    UIAlertView(title: "成功", message: "登陆成功", delegate: self, cancelButtonTitle: "确定").show()
                    isSuccess=true
                    break
                }
            }
        }
        if isSuccess==false {
            UIAlertView(title: "失败", message: "登陆失败", delegate: self, cancelButtonTitle: "确定").show()
        }

    }
}