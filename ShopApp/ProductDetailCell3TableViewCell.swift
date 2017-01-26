//
//  ProductDetailCell3TableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/10/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

class ProductDetailCell3TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    var product: Product!
    var products = [Product]()
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    func loadJSON(completed:@escaping DownloadComplete) {
        Alamofire.request("http://www.all2built.com/api/v2/product/").responseJSON { response in
            if let result = response.result.value as? Dictionary<String, AnyObject> {
                if let product = result["product"] as? [Dictionary<String, AnyObject>] {
                    for obj in product {
                        let product = Product(productDictionary: obj)
                        self.products.append(product)
                    }
                    self.collectionView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.row]
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell0, for: indexPath) as? MoreProductCollectionViewCell
        cell0?.configureCell(product: product)
        return cell0!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadJSON {
            
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
