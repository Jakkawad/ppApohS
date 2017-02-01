//
//  HomeTableViewCell2.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

protocol HomeTableViewCell2Delegate {
    func getHeight(height: Double, numberOfArray: Int)
    func getCollectionCell(product: Product)
}

class HomeTableViewCell2: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, HomeCollectionViewLayoutDelegate {

    var products = [Product]()
    var product: Product!
    
    var delegate: HomeTableViewCell2Delegate?
    var itemHeight:Double = 0.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func loadJSON(completed:@escaping DownloadComplete) {
        Alamofire.request("http://a2b.mul.pw/api/v2/product/").responseJSON { response in
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
    
    func getHeight(height: Double) {
        itemHeight = height
//        print("itemHeight")
        delegate?.getHeight(height: itemHeight, numberOfArray: products.count)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.row]
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell0", for: indexPath) as? HomeCollectionViewCell1
//        cell0?.layer.borderWidth = 2.0
//        cell0?.layer.borderColor = UIColor.orange.cgColor
        cell0?.configureCell(product: product)
        return cell0!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
        let product = products[indexPath.row]
        delegate?.getCollectionCell(product: product)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadJSON {
            
        }
        if let layout = collectionView?.collectionViewLayout as? HomeCollectionViewLayout {
            layout.delegate = self
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
