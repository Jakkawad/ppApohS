//
//  CartTableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/19/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol CartTableViewCellDelegate {
//    func reloadSection(number: Int, action: String)
    func qulityPlus(qulity: Int, product_id: String)
    func qulityNegative(qulity: Int, product_id: String)
}

class CartTableViewCell: UITableViewCell {

    var product: Product!
    var product_id: String!
    var product_qulity: Int = 1
    var product_price: Int = 0
    var total_price: Int = 0
    
    var delegate: CartTableViewCellDelegate?
    
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var txtProductQulity: UITextField!
    @IBOutlet weak var lblProductPrice: UILabel!
    
//    @IBOutlet weak var btnPlus: UIButton!
    
    @IBAction func btnNegative(_ sender: UIButton) {
        if product_qulity == 1 {
            
        } else {
            product_qulity -= 1
            total_price = product_price * product_qulity
            txtProductQulity.text = String(product_qulity)
            lblProductPrice.text = String(total_price)
            delegate?.qulityNegative(qulity: product_qulity, product_id: product_id)
        }
    }
    
    @IBAction func btnPlus(_ sender: UIButton) {
        product_qulity += 1
        total_price = product_price * product_qulity
        txtProductQulity.text = String(product_qulity)
        lblProductPrice.text = String(total_price)
        delegate?.qulityPlus(qulity: product_qulity, product_id: product_id)
    }
    
    func configureCell(product: Product, qulity: Int) {
        product_id = product.id
        product_price = Int(product.snat_price)!
        lblProductName.text = product.name
        txtProductQulity.text = String(qulity)
//        imageViewProduct.af_setImage(withURL: NSURL(string: "http://a2b.mul.pw/static/img/\(product.imageShow_cover)") as! URL)
        imageViewProduct.af_setImage(withURL: NSURL(string: ALL2SALE_API_IMAGE_PATH + product.imageShow_cover) as! URL)
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
