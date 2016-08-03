//
//  RoundButton.swift
//  GroupTall
//
//  Created by Dule on 8/2/16.
//  Copyright © 2016 liuzhenyu. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = (cornerRadius > 0)
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
}
