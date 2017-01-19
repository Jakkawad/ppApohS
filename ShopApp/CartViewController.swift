//
//  CartViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartTableViewCellDelegate {
    
    var numberOfArray: Int!
    
    @IBOutlet weak var tableView:UITableView!
    
//    @IBAction func btnNegative(_ sender: UIButton) {
//        print("-")
//    }
//    
//    @IBAction func btnPlus() {
//        print("+")
//    }

    func reloadSection(number: Int, action: String) {
        print("reload")
//        var product = productArray[number]
//        let quilty = Int(product["quilty"]!)
//        if action == "Plus" {
//            print("+")
//            quilty! + 1
//            print(quilty)
//        } else {
//            print("-")
//            quilty! - 1
//            print(quilty)
//        }
        tableView.reloadSections(NSIndexSet(index: number) as IndexSet, with: .none)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let product = productArray[indexPath.section]
        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? CartTableViewCell
//        cell0?.lblName.text = product["name"]
//        cell0?.txtQuilty.text = product["quilty"]
//        cell0?.quilty = Int(product["quilty"]!)!
        cell0?.numberOfArray = indexPath.section
        cell0?.delegate = self
        return cell0!

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
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
