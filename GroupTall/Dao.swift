//
//  Dao.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/6/30.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import Foundation
class DAO {
    internal class var sharedInstance: DAO {
        struct Static {
            static var instance: DAO?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = DAO()
        }
        return Static.instance!
    }
    func insert(tableName:String,insertInfo:NSDictionary)->BmobObject{
        let bmob:BmobObject = BmobObject(className: tableName)
        for (key,data) in insertInfo{
            bmob.setObject(data, forKey: key as! String)
        }
        return bmob
    }
}