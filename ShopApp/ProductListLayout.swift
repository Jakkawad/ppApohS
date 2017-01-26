//
//  ProductListLayout.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/25/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ProductListLayout: UICollectionViewFlowLayout {
    
    var numberOfItemsPerRow: Int = 1 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepare() {
        super.prepare()
        
        if let collectionView = self.collectionView {
            var newItemSize = itemSize
            let itemsPersRow = CGFloat(max(numberOfItemsPerRow, 1))
            let totalSpacing = minimumInteritemSpacing * (itemsPersRow - 1.0)
            newItemSize.width = (collectionView.bounds.size.width - totalSpacing) / itemsPersRow
//            print("width: \(newItemSize.width)")
//            print("bounds: \(collectionView.bounds.size.width)")
            if itemSize.height > 0 {
//                let itemAspectRatio = itemSize.width / itemSize.height
//                print("ratio: \(itemAspectRatio)")
                newItemSize.height = 200//newItemSize.width / itemAspectRatio
//                print("height: \(newItemSize.height)")
            }
            itemSize = newItemSize
//            print("itemSize: \(itemSize)")
        }
    }
    
}
