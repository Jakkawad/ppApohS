//
//  ProfileCircular.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/16/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ProfileCircular: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
