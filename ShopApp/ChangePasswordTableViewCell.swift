//
//  ChangePasswordTableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/20/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol ChangePasswordTableViewCellDelegate {
    func returnValueText(string: String, number: Int)
}

class ChangePasswordTableViewCell: UITableViewCell, UITextFieldDelegate {

    var numberOfArray: Int!
    var delegate: ChangePasswordTableViewCellDelegate?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDetail: UITextField!
    
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
