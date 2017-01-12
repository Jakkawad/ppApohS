//
//  HomeTableViewCell2.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol HomeTableViewCell2Delegate {
    func getHeight(height: Double)
}

class HomeTableViewCell2: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, HomeCollectionViewLayoutDelegate {

    var delegate: HomeTableViewCell2Delegate?
    var itemHeight:Double = 0.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func getHeight(height: Double) {
        itemHeight = height
        delegate?.getHeight(height: itemHeight)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell0", for: indexPath)
        cell0.layer.borderWidth = 2.0
        cell0.layer.borderColor = UIColor.orange.cgColor
        return cell0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
