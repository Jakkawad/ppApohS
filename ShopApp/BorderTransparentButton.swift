//
//  BorderTransparentButton.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/13/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class BorderTransparentButton: UIButton {
    
    let borderAlpha: CGFloat = 1
    let cornerRadius: CGFloat = 5.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        self.layer.cornerRadius = cornerRadius
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
