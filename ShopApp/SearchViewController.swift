//
//  SearchViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SearchProductTableDelegate {

    var dataArray = ["A", "B"]
    var searchProduct: Product!
    
    var resultSearchController: UISearchController!
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
        cell0?.textLabel?.text = dataArray[indexPath.row]
        return cell0!
    }
    
    func searchProduct(product: Product) {
        searchProduct = product
        performSegue(withIdentifier: "ProductSearchSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // SearchTable
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "ProductSearchTable") as! SearchProductTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for products"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController.hidesNavigationBarDuringPresentation = false
        resultSearchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductSearchSegue" {
            let productDetailViewController = segue.destination as? ProductDetailViewController
            productDetailViewController?.product = searchProduct
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
