//
//  ShippingViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/18/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ShippingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var shippingArray = ["DHL":"5", "Czech post":"3"]
    var personalPickupArray = ["Free":"0"]
    
    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return shippingArray.count
        } else {
            return personalPickupArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
//        return cell0!
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let dictKey = Array(shippingArray.keys)[indexPath.row]
            let dictValue = Array(shippingArray.values)[indexPath.row]
            cell0?.textLabel?.text = dictKey
            cell0?.detailTextLabel?.text = dictValue
            return cell0!
        } else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let dictKey = Array(personalPickupArray.keys)[indexPath.row]
            let dictValue = Array(personalPickupArray.values)[indexPath.row]
            cell1?.textLabel?.text = dictKey
            cell1?.detailTextLabel?.text = dictValue
            return cell1!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "SHIPPING"
        } else {
            return "PERSONAL PICKUP"
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
