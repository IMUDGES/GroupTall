//
//  AppDelegate.swift
//  GroupTall
//
//  Created by liuzhenyu on 16/6/22.
//  Copyright © 2016年 liuzhenyu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , RCIMUserInfoDataSource {

    var window: UIWindow?
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        
        userInfo.userId = userId
        
        switch userId {
        case "dule":
            userInfo.name = "Dule"
            userInfo.portraitUri = "https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D200/sign=43c5dc24ce5c10383b7ec9c28210931c/e1fe9925bc315c609e3db7d185b1cb1349547760.jpg"
        case "test":
            userInfo.name = "测试用户"
            userInfo.portraitUri = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3417293762,3718020601&fm=116&gp=0.jpg"
        default: break
        }
        return completion(userInfo)
    }
    
    func connectServer(completion:()->Void){
        RCIM.sharedRCIM().initWithAppKey("pkfcgjstffii8")
        RCIM.sharedRCIM().connectWithToken("Jns19QbSYpPpcwhmV9pCW5u8QR//XUQ5lfJjK+zYxJveEeZkj8slgaKTXaINfSEg8FA9/h7EWYGlFj8zSlvS4w==", success: { (_) in
            let currentUserInfo = RCUserInfo(userId: "test", name: "测试用户", portrait: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3417293762,3718020601&fm=116&gp=0.jpg")
            RCIM.sharedRCIM().currentUserInfo = currentUserInfo
            dispatch_async(dispatch_get_main_queue(), {
                completion()
            })
            }, error: { (_) in
                print("失败")
        }) {
            print("错误")
        }
        let user = RCUserInfo(userId: "test", name: "测试用户", portrait: "")
        RCIMClient.sharedRCIMClient().currentUserInfo = user
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Bmob.registerWithAppKey("4b170ca849e5130ad7ad5d97e75f5b08")
        RCIM.sharedRCIM().userInfoDataSource = self
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

