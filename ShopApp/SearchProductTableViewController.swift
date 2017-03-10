//
//  SearchProductTableViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 3/7/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchProductTableDelegate {
    func searchProduct(product: Product)
}
class SearchProductTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    var filterProducts = [Product]()
    var historyProducts = ["Ant", "Birt"]
    
    var delegate: SearchProductTableDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    func searchJSON(keyword: String) {
        Alamofire.request("http://a2b.mul.pw/api/v2/product/?where=name_product;like;;ap;\(keyword);ap;;and;show_hidden;eq;1").responseJSON { response in
            if let result = response.result.value as? Dictionary<String, AnyObject> {
                if let product = result[PRODUCT] as? [Dictionary<String, AnyObject>] {
                    for obj in product {
                        let product = Product(productDictionary: obj)
                        self.filterProducts.append(product)
//                        print(product.name)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filterProducts.count
        if section == 0 {
            return filterProducts.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell0 = tableView.dequeueReusableCell(withIdentifier: "tableCell0")
//        let product = filterProducts[indexPath.row]
//        cell0?.textLabel?.text = product.name
//        return cell0!
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            let product = filterProducts[indexPath.row]
            cell0?.textLabel?.text = product.name
            return cell0!
        } else {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            cell0?.textLabel?.text = historyProducts[indexPath.row]
            return cell0!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = filterProducts[indexPath.row]
        delegate?.searchProduct(product: product)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }
        return tableView.sectionHeaderHeight
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterProducts.removeAll()
        if filterProducts.count == 0 {
            filterProducts.removeAll()
            self.tableView.reloadData()
        }
//        print("updateSearchResults")
        let searchBarText = searchController.searchBar.text!
//        print(searchBarText)
        searchJSON(keyword: searchBarText)
        print("count: \(filterProducts.count)")
//        let delayInSeconds = 0.5
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
//
//            // here code perfomed with delay
//            self.tableView.reloadData()
//
//        }
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
