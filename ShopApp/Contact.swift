//
//  Contact.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 3/11/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import Foundation

class Contact {
    var _id: String!
    var _user_id: String!
    var _address: String!
    var _phone_number: String!
    var _add_date: String!
    var _contact_name: String!
    var _district: String!
    var _prefecture: String!
    var _province: String!
    var _zipcode: String!
    var id: String {
        return _id
    }
    var user_id: String {
        return _user_id
    }
    var address: String {
        return _address
    }
    var phone_number: String {
        return _phone_number
    }
    var add_date: String {
        return _add_date
    }
    var contact_name: String {
        return _contact_name
    }
    var district: String {
        return _district
    }
    var prefecture: String {
        return _prefecture
    }
    var province: String {
        return _province
    }
    var zipcode: String {
        return _zipcode
    }
    init(contactDictionary: Dictionary<String, AnyObject>) {
        if let id = contactDictionary["id"] as? String {
            self._id = id
        }
        if let user_id = contactDictionary["user_id"] as? String {
            self._user_id = user_id
        }
        if let address = contactDictionary["address"] as? String {
            self._address = address
        }
        if let phone_number = contactDictionary["phone_number"] as? String {
            self._phone_number = phone_number
        }
        if let add_date = contactDictionary["add_date"] as? String {
            self._add_date = add_date
        }
        if let contact_name = contactDictionary["contact_name"] as? String {
            self._contact_name = contact_name
        }
        if let district = contactDictionary["district"] as? String {
            self._district = district
        }
        if let prefecture = contactDictionary["prefecture"] as? String {
            self._prefecture = prefecture
        }
        if let province = contactDictionary["province"] as? String {
            self._province = province
        }
        if let zipcode = contactDictionary["zipcode"] as? String {
            self._zipcode = zipcode
        }
    }
}
//"id": "17",
//"userid": "60",
//"address": "\u0e40\u0e25\u0e02\u0e17\u0e35\u0e48 26 \u0e2b\u0e21\u0e39\u0e48 3",
//"phone_number": "0641235678",
//"add_date": "2017-02-03 16:19:12",
//"contact_name": "\u0e18\u0e19\u0e0a\u0e34\u0e15 \u0e2a\u0e34\u0e17\u0e18\u0e34\u0e01\u0e31\u0e19",
//"district": "\u0e1c\u0e32\u0e15\u0e2d",
//"prefecture": "\u0e17\u0e48\u0e32\u0e27\u0e31\u0e07\u0e1c\u0e32",
//"province": "\u0e19\u0e48\u0e32\u0e19",
//"zipcode": "55140"
