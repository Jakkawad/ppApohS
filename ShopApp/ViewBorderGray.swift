//
//  ViewBorderGray.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/18/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewBorderGray: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.layer.cornerRadius = self.frame.size.width / 2
//        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.cornerRadius = 1
    }
}
