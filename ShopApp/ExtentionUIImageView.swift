//
//  ExtentionUIImageView.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 3/9/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    // Blur Effect
//    yourImageView.addBlurEffect()
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}
