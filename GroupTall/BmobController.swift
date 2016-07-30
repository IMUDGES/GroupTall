//
//  BmobController.swift
//  GroupTall
//
//  Created by Dule on 7/30/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import Foundation

class BmobController{
    internal static func insert(tableName:String,insertInfo:NSDictionary)->BmobObject{
        let bmob:BmobObject = BmobObject(className: tableName)
        for (key,data) in insertInfo{
            bmob.setObject(data, forKey: key as! String)
        }
        return bmob
    }
}