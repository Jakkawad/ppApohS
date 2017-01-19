//
//  CartTableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/19/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol CartTableViewCellDelegate {
    func reloadSection(number: Int, action: String)
}

class CartTableViewCell: UITableViewCell {

    var numberOfArray: Int!
    var quilty: Int!
    
    var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var lblName: UILabel!
//    @IBOutlet weak var btnNegative: UIButton!
    @IBOutlet weak var txtQuilty: UITextField!
//    @IBOutlet weak var btnPlus: UIButton!
    
    @IBAction func btnNegative(_ sender: UIButton) {
//        if quilty == 1 {
//            
//        } else {
//            delegate?.reloadSection(number: numberOfArray, action: "Negative")
//        }
    }
    
    
    @IBAction func btnPlus(_ sender: UIButton) {
//        delegate?.reloadSection(number: numberOfArray, action: "Plus")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        txtQuilty.text = String(quilty)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
