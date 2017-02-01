//
//  HomeCollectionViewLayout.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol HomeCollectionViewLayoutDelegate {
    func getHeight(height: Double)
}

class HomeCollectionViewLayout: UICollectionViewFlowLayout {

    var delegate: HomeCollectionViewLayoutDelegate?
    
    var numberOfItemsPerRow: Int = 2 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepare() {
        super.prepare()
        
        if let collectionView = self.collectionView {
            var newItemSize = itemSize
            let itemsPersRow = CGFloat(max(numberOfItemsPerRow, 1))
//            print("itemPerRow: \(itemsPersRow)")
            let totalSpacing = minimumInteritemSpacing * (itemsPersRow - 1.0)
//            print("totalSpacing: \(totalSpacing)")
            newItemSize.width = (collectionView.bounds.size.width - totalSpacing) / itemsPersRow
            if itemSize.height > 0 {
                let itemAspectRatio = itemSize.width / itemSize.height
                newItemSize.height = newItemSize.width / itemAspectRatio
            }
            itemSize = newItemSize
//            print("itemSize: \(itemSize)")
            delegate?.getHeight(height: Double(newItemSize.height))
        }
    }
}
