//
//  MoreProductCollectionViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/25/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import AlamofireImage

class MoreProductCollectionViewCell: UICollectionViewCell {
    
    var product: Product!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    func configureCell(product: Product) {
        let text1 = labelStrikethrough(text: product.nat_price)
        let text2 = NSMutableAttributedString(string: "   \(product.snat_price)")
        let combination = NSMutableAttributedString()
        combination.append(text1)
        combination.append(text2)
        lblProductPrice.attributedText = combination
        imageViewProduct.af_setImage(withURL: NSURL(string: "http://www.all2built.com/static/img/\(product.imageShow_cover)") as! URL)
    }
}
