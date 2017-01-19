
//
//  ViewBounds.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/19/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ViewBounds: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
//        view.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
    }
}
