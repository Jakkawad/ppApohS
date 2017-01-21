//
//  FilterSliderTableViewCell.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/20/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import SwiftRangeSlider

protocol FilterSliderTableViewCellDelegate {
    func rangeSlider(lower: Int, upper: Int)
}
class FilterSliderTableViewCell: UITableViewCell {

//    var priceLowerStart: Int!
//    var priceUpperStart: Int!
    
    var delegate: FilterSliderTableViewCellDelegate?
    
    @IBOutlet weak var lblUpper: UILabel!
    @IBOutlet weak var lblLower: UILabel!
    @IBOutlet weak var rangeSlider: RangeSlider!
    
    @IBAction func rangeSliderValuesChanged(_ rangeSlider: RangeSlider) {
//        print("\(rangeSlider.lowerValue), \(rangeSlider.upperValue)")
        let lowerInt = Int(rangeSlider.lowerValue)
        let upperInt = Int(rangeSlider.upperValue)
        lblLower.text = "\(lowerInt) $"//"\(rangeSlider.lowerValue)"
        lblUpper.text = "\(upperInt) $"//"\(rangeSlider.upperValue)"
        delegate?.rangeSlider(lower: lowerInt, upper: upperInt)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rangeSlider.minimumValue = 0
        rangeSlider.maximumValue = 10000
        rangeSlider.lowerValue = 100
        rangeSlider.upperValue = 9000
        lblLower.text = "100"
        lblUpper.text = "9000"
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
