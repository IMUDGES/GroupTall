//
//  User.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/7/30.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import Foundation
class User {
    internal init(phoneNumber:String?,password:String?){
        self.phoneNumber=phoneNumber
        self.password=password
    }
    private var phoneNumber:String?
    private var password:String?
    internal func getPhoneNumber()->String?{
        return self.phoneNumber
    }
    internal func getPassword()->String?{
        return self.password
    }
}