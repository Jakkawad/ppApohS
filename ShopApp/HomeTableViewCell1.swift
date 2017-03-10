//
//  HomeTableViewCell1.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

protocol HomeTableViewCell1Delegate {
    func didSelectRow()
}
class HomeTableViewCell1: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var product: Product!
    var products = [Product]()
    
    var delegate: HomeTableViewCell1Delegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func loadJSON(completed:@escaping DownloadComplete) {
//        Alamofire.request("http://a2b.mul.pw/api/v2/product/").responseJSON { response in
        Alamofire.request(ALL2SALE_API_PRODUCT).responseJSON { response in
            if let result = response.result.value as? Dictionary<String, AnyObject> {
                if let product = result[PRODUCT] as? [Dictionary<String, AnyObject>] {
//                    print(product)
                    for obj in product {
                        let product = Product(productDictionary: obj)
                        self.products.append(product)
//                        print("OBJ = \(obj)")
//                        print(product.name)
                    }
//                    self.products.remove(at: 0)
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
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell0, for: indexPath) as? HomeCollectionViewCell0
        cell0?.configureCell(product: product)
        return cell0!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectRow()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        print("URL: \(ALL2SALE_API + "product/")")
        loadJSON {
//            print("loadJson")
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
