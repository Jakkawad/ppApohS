//
//  GeneralClass.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/21/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import Foundation
import UIKit

// Count string -> height and width to cell
func stringCount(text:String) -> Int {
    return text.characters.count
}

// Label strike through
func labelStrikethrough(text: String) -> NSMutableAttributedString {
    let attributeString = NSMutableAttributedString(string: text)
    attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
    return attributeString
}
