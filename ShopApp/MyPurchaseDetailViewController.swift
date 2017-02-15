//
//  MyPurchaseDetailViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 2/13/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class MyPurchaseDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MyPurchaseDetailCell0Delegate {
    
    var cell0Height: Int!
    var cell0Row: Int!
    var cell0TotalHeight: Int = 110
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnAction(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "RefundSegue", sender: nil)
    }
    
    func getRow(row: Int, height: CGFloat) {
        let freeSpace: Int = 28
        cell0TotalHeight = (Int(height) * row) + 145 + freeSpace
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? MyPurchaseDetailCell0TableViewCell
            cell0?.delegate = self
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
            return CGFloat(cell0TotalHeight)
        } else {
            return 100
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
