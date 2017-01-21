//
//  HomeCollectionViewCell0.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeCollectionViewCell0: UICollectionViewCell {
    
    var product: Product!
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    func configureCell(product: Product) {
//        let attributeString = NSMutableAttributedString(string: product.nat_price)
//        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
//        lblProductPrice.text = "$ \(product.nat_price)"
//        lblProductPrice.attributedText = attributeString
        lblProductPrice.attributedText = labelStrikethrough(text: product.nat_price)
//        let nat_price = product.nat_price
//        let snat_price = labelStrikethrough(text: product.snat_price)
//        lblProductPrice.attributedText = nat_price + snat_price
        imageViewProduct.af_setImage(withURL: NSURL(string: "http://www.all2built.com/static/img/\(product.imageShow_cover)") as! URL)
    }
}
