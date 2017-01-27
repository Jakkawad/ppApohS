//
//  ProductDetailViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import ImageSlideshow
import AlamofireImage

class ProductDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditProductViewControllerDelegate {
    
    var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate?
//    let localSource = [ImageSource(imageString: "pink-shirt.jpg")!, ImageSource(imageString: "white-shirt")!, ImageSource(imageString: "gray-shirt")!, ImageSource(imageString: "orange-shirt")!]

    var localSource = [AlamofireSource(urlString: "")]
    
    var product: Product!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet var slideshow: ImageSlideshow!
    
    
    
    // Header
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    
    // MARK: Protocol
    
    func getQulity(qulity: Int) {
        print("qulity: \(qulity)")
    }
    
    // MARK: Function
    
    @IBAction func addToCart(_ sender: UIButton) {
        print("Add to the cart")
        performSegue(withIdentifier: "ProductOptionSegue", sender: self)
    }
    
    @IBAction func shareWithFriends(_ sender: UIButton) {
        print("Share with friends")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 3 //Comment
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as?
                ProductDetailCell0TableViewCell
//                cell0?.btnAction.backgroundColor = UIColor.red
                cell0?.btnAction.setTitle("Buy", for: .normal)
                cell0?.btnAction.addTarget(self, action: #selector(ProductDetailViewController.addToCart(_:)), for: .touchUpInside)
                cell0?.selectionStyle = .none
                return cell0!
            } else {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? ProductDetailCell0TableViewCell
                cell1?.btnAction.setTitle("Wish list", for: .normal)
//                cell1?.btnAction.backgroundColor = UIColor.blue
                cell1?.btnAction.addTarget(self, action: #selector(ProductDetailViewController.shareWithFriends(_:)), for: .touchUpInside)
                cell1?.selectionStyle = .none
                return cell1!
            }
        } else if indexPath.section == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell1) as? ProductDetailCell1TableViewCell
//            let attStr = try! NSAttributedString(data: "<b><i>\(product.detail)</i>,</b>".data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
//            cell2?.lblDetail.attributedText = attStr
            cell2?.lblDetail.text = product.detail
//            cell2?.lblDetail.text = "Lorem ipsum dolor sit amet, consectetur volutpat."
            cell2?.selectionStyle = .none
            return cell2!
        } else if indexPath.section == 2 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: tableCell4)
            return cell4!
        } else if indexPath.section == 3 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell2)
            cell2?.selectionStyle = .none
            return cell2!
        } else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: tableCell3) as? ProductDetailCell3TableViewCell
            cell3?.selectionStyle = .none
            return cell3!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            performSegue(withIdentifier: "ProductCommentSegue", sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        } else if indexPath.section == 1 {
            return 230
        } else if indexPath.section == 2 {
            return 34
        } else if indexPath.section == 3 {
            return 100
        } else if indexPath.section == 4 {
            return 220
        } else {
            return 220
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Effect
        self.title = product.name
        self.lblProductName.text = product.name
//        self.lblProductPrice.text = product.nat_price
        let text1 = labelStrikethrough(text: product.nat_price)
        let text2 = NSMutableAttributedString(string: "   \(product.snat_price)")
        let combination = NSMutableAttributedString()
        combination.append(text1)
        combination.append(text2)
        lblProductPrice.attributedText = combination
        // JSON
        
        // TableView no border
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        
        //
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray;
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black;
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
        
//        slideshow.setImageInputs(localSource)
        let image = "http://www.all2built.com/static/img/\(product.imageShow_cover)"
        slideshow.setImageInputs([AlamofireSource(urlString: image)!])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductOptionSegue" {
            let productOptionVC = segue.destination as? EditProductViewController
            productOptionVC?.delegate = self
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
