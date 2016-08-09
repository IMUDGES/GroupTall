//
//  CustomContactsCell.swift
//  SwiftAccessContactsDemo
//
//  Created by huangwenchen on 15/11/27.
//  Copyright © 2015年 wenchenhuang. All rights reserved.
//

import Foundation
import UIKit

class ContactCell:UITableViewCell{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        
    }
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        self.performSegueWithIdentifier("ShowUserInfo", sender: self )
//        // Configure the view for the selected state
//    }
}