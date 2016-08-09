//
//  UserInfoViewController.swift
//  GroupTall
//
//  Created by Dule on 8/9/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

class UserInfoTableViewController: UITableViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var maleOrfamale: UIImageView!
    @IBOutlet weak var phoneNumber: UILabel!
    internal var Tname = ""
    internal var TphoneNumber = ""
    internal var Timage:UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = Tname
        self.phoneNumber.text = TphoneNumber
        self.image.image = Timage
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.tableView.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
