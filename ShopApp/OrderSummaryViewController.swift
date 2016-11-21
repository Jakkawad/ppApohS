//
//  OrderSummaryViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/19/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    var productArray = ["Women's T-Shirt":"449.00", "Women's T-Shirt":"449.00", "Women's T-Shirt":"449.00", "Women's T-Shirt":"449.00"]
    var productArray = ["Boot":"499", "Hat":"499"]
    var shippingAndPaymentArray = ["Shipping":"DHL", "Payment":"Credit card"]
    var addressArray = ["Sunny Juof":"12345678", "Road":"jakkawad.c@gmail.com", "578":"467"]
    
    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        if section == 0 {
            return productArray.count
//            return 2
        } else if section == 1 {
//            return shippingAndPaymentArray.count
            return 2
        } else {
//            return addressArray.count
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
//        return cell0!
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let dictKey = Array(productArray.keys)[indexPath.row]
            let dictValue = Array(productArray.values)[indexPath.row]
            cell0?.textLabel?.text = dictKey
            cell0?.detailTextLabel?.text = dictValue
            return cell0!
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let dictKey = Array(shippingAndPaymentArray.keys)[indexPath.row]
            let dictValue = Array(shippingAndPaymentArray.values)[indexPath.row]
            cell1?.textLabel?.text = dictKey
            cell1?.detailTextLabel?.text = dictValue
            return cell1!
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let dictKey = Array(shippingAndPaymentArray.keys)[indexPath.row]
            let dictValue = Array(shippingAndPaymentArray.values)[indexPath.row]
//            print("DictKey: \(dictKey)")
            cell2?.textLabel?.text = dictKey
            cell2?.detailTextLabel?.text = dictValue
            return cell2!
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "PRODUCTS"
        } else if section == 1 {
            return "SHIPPING AND PAYMENT"
        } else {
            return "ADDRESS"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
