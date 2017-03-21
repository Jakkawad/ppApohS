//
//  Category.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 3/10/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import Foundation

class Category {
    var _id: String!
    var _name: String!
    var _name_en: String!
    var _parent_id: String!
    var _show_hidden: String!
    var _image: String!
    var _image_en: String!
    
    var id: String {
        return _id
    }
    
    var name: String {
        return _name
    }
    
    var name_en: String {
        return _name_en
    }
    
    var parent_id: String {
        return _parent_id
    }
    
    var show_hidden: String {
        return _show_hidden
    }
    
    var image: String {
        return _image_en
    }
    
    var image_en: String {
        return _image_en
    }
    
    init(categoryDictionary: Dictionary<String, AnyObject>) {
        if let id = categoryDictionary[API_CategoryFields_Id] as? String {
            self._id = id
        }
        if let name = categoryDictionary[API_CategoryFields_Name] as? String {
            self._name = name
        }
        if let name_en = categoryDictionary[API_CategoryFields_Name_En] as? String {
            self._name_en = name_en
        }
        if let parent_id = categoryDictionary[API_CategoryFields_Parent_Id] as? String {
            self._parent_id = parent_id
        }
        if let show_hidden = categoryDictionary[API_CategoryFields_Show_Hidden] as? String {
            self._show_hidden = show_hidden
        }
        if let image = categoryDictionary[API_CategoryFields_Image] as? String {
            self._image = image
        }
        if let image_en = categoryDictionary[API_CategoryFields_Image_En] as? String {
            self._image_en = image_en
        }
    }
}
//"id": "1",
//"name": "\u0e2a\u0e34\u0e19\u0e04\u0e49\u0e32\u0e44\u0e2d\u0e17\u0e35 \u0e41\u0e25\u0e30 Gadget",
//"name_en": "",
//"parentid": "0",
//"show_hidden": "1",
//"image": "it01.jpg",
//"image_en": "it02.jpg"
