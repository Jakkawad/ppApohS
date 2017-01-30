//
//  HomeCollectionViewCell1.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeCollectionViewCell1: UICollectionViewCell {
    
    var product: Product!
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    func configureCell(product: Product) {
//        lblProductPrice.text = "$ \(product.nat_price)"
        let text1 = labelStrikethrough(text: product.nat_price)
        let text2 = NSMutableAttributedString(string: "   \(product.snat_price)")
        let combination = NSMutableAttributedString()
        combination.append(text1)
        combination.append(text2)
        lblProductPrice.attributedText = combination
        imageViewProduct.af_setImage(withURL: NSURL(string: "http://a2b.mul.pw/static/img/\(product.imageShow_cover)") as! URL)
    }
}
