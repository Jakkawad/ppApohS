//
//  HomeViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/12/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeTableViewCell2Delegate, HomeTableViewCell1Delegate {

    @IBOutlet weak var tableView: UITableView!
    
    var collectionItemHeight: Double = 0.0
    var collectionCell: CGFloat = 0.0
    // Protocol
    
    func didSelectRow() {
        print("didselect")
        performSegue(withIdentifier: "ProductAllSegue", sender: nil)
    }
    
    func getHeight(height: Double) {
        let heightResult: Double = (height * 5) + (5 * 10) + (6 * 5)
        collectionItemHeight = Double(heightResult)
        collectionCell = CGFloat(collectionItemHeight)
        tableView.reloadSections(NSIndexSet(index: 2) as IndexSet, with: .none)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "tableCell0") as? HomeTableViewCell0
            return cell0!
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "tableCell1") as? HomeTableViewCell1
            cell1?.delegate = self
            return cell1!
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "tableCell2") as? HomeTableViewCell2
            cell2?.delegate = self
            return cell2!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else if indexPath.section == 1 {
            return 120
        } else {
//            print(collectionCell)
            return collectionCell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.allowsSelection = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegue" {
            let productAllVC = segue.destination as? ProductViewController
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
