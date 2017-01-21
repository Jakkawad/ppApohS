//
//  AddShippingTableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/19/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol AddShippingTableViewCellDelegate {
    func returnValueText(string: String, number: Int)
}

class AddShippingTableViewCell: UITableViewCell, UITextFieldDelegate {

    var numberOfArray: Int!
    var delegate: AddShippingTableViewCellDelegate?
    
    @IBOutlet weak var txtDetail: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(textField)
        delegate?.returnValueText(string: textField.text!, number: numberOfArray)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
