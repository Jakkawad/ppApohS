//
//  Product.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/25/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import Foundation

class Product {
    private var _id:String!
    private var _name:String!
    private var _category:String!
    private var _image:[String]!
    private var _description:String!
    private var _price:Double!
    
    var id:String {
        return _id
    }
    
    var name:String {
        return _name
    }
    
    var category:String {
        return _category
    }
    
    var image:[String] {
        return _image
    }
    
    var description:String {
        return _description
    }
    
    var price:Double {
        return _price
    }
    
    init(id:String, name:String, category:String, image:[String], description:String, price:Double) {
        _id = id
        _name = name
        _category = category
        _image = image
        _description = description
        _price = price
    }
}
