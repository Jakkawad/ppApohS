//
//  MyPurchaseDetailCell0TableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 2/13/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol MyPurchaseDetailCell0Delegate {
    func getRow(row: Int, height: CGFloat)
}

class MyPurchaseDetailCell0TableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    var delegate: MyPurchaseDetailCell0Delegate?
    
    var productInPaper = ["A", "B", "C"]
    var productCellHeight: CGFloat = 60
    var productCellDetail: CGFloat = 145
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        if section == 0 {
            return productInPaper.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        delegate?.getRow(row: productInPaper.count, height: productCellHeight)
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            cell0?.selectionStyle = .none
            return cell0!
        } else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell1)
            cell1?.selectionStyle = .none
            return cell1!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return productCellHeight
        } else {
            return productCellDetail
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
