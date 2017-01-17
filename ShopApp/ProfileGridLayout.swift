//
//  ProfileGridLayout.swift
//  ProfilePage
//
//  Created by Jakkawad Chaiplee on 1/16/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ProfileGridLayout: UICollectionViewFlowLayout {
    
    var numberOfItemsPerRow: Int = 3 {
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
            if itemSize.height > 0 {
                let itemAspectRatio = itemSize.width / itemSize.height
                newItemSize.height = newItemSize.width / itemAspectRatio
            }
            itemSize = newItemSize
//            print("itemSize: \(itemSize)")
        }
    }
    
}
