//
//  ProductViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

class ProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SortViewControllerDelegate, FilterValueDelegate {

    var product: Product!
    var products = [Product]()
    
    var productSelected: Product!
    
    var priceLower: Int!
    var priceUpper: Int!
    var optionValue1: String!
    var optionValue2: String!
    var optionValue3: String!
    var optionValue4: String!
    var optionValue5: String!
    
    var isGrid: Bool = true
    var isList: Bool = false
    
    let gridFlowLayout = ProductGirdLayout()
    let listFlowLayout = ProductListLayout()

    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            
        }
    }
    
//    func setupGrid() {
//        self.collectionView.collectionViewLayout.invalidateLayout()
//        self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: false)
//    }
//    
//    func setupInitialLayout() {
//        isGridFlowLayoutUsed = true
//        collectionView.collectionViewLayout = gridFlowLayout
//    }
    
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    @IBAction func unWindSort(segue: UIStoryboardSegue) {
        if let sortVC = segue.source as? SortViewController {
            let index = sortVC.tableView.indexPathForSelectedRow
            let cell = sortVC.tableView.cellForRow(at: index!)
            let msg = cell?.textLabel?.text
            print(msg!)
        }
    }
    
    @IBAction func btnGrid(_ sender: Any) {
        print("Grid")
        isGridFlowLayoutUsed = true
        collectionView.reloadData()
        self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: true)
//        collectionView.reloadSections(NSIndexSet(index: 0) as IndexSet)
//        isGridFlowLayoutUsed = true
//        collectionView.reloadData()
//        UIView.animate(withDuration: 0.2) { () -> Void in
//            self.collectionView.collectionViewLayout.invalidateLayout()
//            self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: false)
//        }
//        collectionView.reloadData()
    }
    
    @IBAction func btnList(_ sender: Any) {
        print("List")
        isGridFlowLayoutUsed = false
        collectionView.reloadData()
        self.collectionView.setCollectionViewLayout(self.listFlowLayout, animated: true)
//        collectionView.reloadSections(NSIndexSet(index: 0) as IndexSet)
//        isGridFlowLayoutUsed = false
//        collectionView.reloadData()
//        UIView.animate(withDuration: 0.2) { () -> Void in
//            self.collectionView.collectionViewLayout.invalidateLayout()
//            self.collectionView.setCollectionViewLayout(self.listFlowLayout, animated: true)
//        }
//        collectionView.reloadData()
    }
    
    @IBAction func btnSort(_ sender: Any) {
        print("Sort")
//        performSegue(withIdentifier: "SortSegue", sender: self)
        let SortVC: SortViewController = storyboard?.instantiateViewController(withIdentifier: "SortViewController") as! SortViewController
        SortVC.delegate = self
        let navigationController = UINavigationController(rootViewController: SortVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func btnFilter(_ sender: Any) {
        print("Filter")
//        performSegue(withIdentifier: "FilterSegue", sender: self)
        let FilterVC: FilterViewController = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        FilterVC.delegate = self
        let navigationController = UINavigationController(rootViewController: FilterVC)
        
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func loadJSON(completed:@escaping DownloadComplete) {
        Alamofire.request(ALL2SALE_API_PRODUCT).responseJSON { response in
            if let result = response.result.value as? Dictionary<String, AnyObject> {
                if let product = result[PRODUCT] as? [Dictionary<String, AnyObject>] {
                    for obj in product {
                        let product = Product(productDictionary: obj)
                        self.products.append(product)
                    }
                    self.collectionView.reloadData()
                }
            }
            completed()
        }
    }
    
    func getFilter(lower: Int, upper: Int, option1: String, option2: String, option3: String, option4: String, option5: String) {
        priceLower = lower
        priceUpper = upper
        optionValue1 = option1
        optionValue2 = option2
        optionValue3 = option3
        optionValue4 = option4
        optionValue5 = option5
    }
    
    func getSort(string: String) {
        print("string: \(string)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.row]
//        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell0, for: indexPath) as? ProductGridCollectionViewCell
//        cell0?.configureCell(product: product)
//        return cell0!
        var tableCell:String!
        if isGridFlowLayoutUsed == true {
//            print("Grid")
            tableCell = tableCell0
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell, for: indexPath) as! ProductGridCollectionViewCell
            cell.configureCell(product: product)
//            print("product: \(products[indexPath.row])")
            return cell
            
        } else {
//            print("List")
            tableCell = tableCell1
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell, for: indexPath) as! ProductListCollectionViewCell
            cell.configureCell(product: product)
//            print("product: \(products[indexPath.row])")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        productSelected = product
        performSegue(withIdentifier: "ProductDetailSegue", sender: self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // BackBarButtonItem = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        setupGrid()
        isGridFlowLayoutUsed = true
        self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: false)
//        self.collectionView.collectionViewLayout.invalidateLayout()
        loadJSON {
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductDetailSegue" {
            let productDetailVC = segue.destination as? ProductDetailViewController
            productDetailVC?.product = productSelected
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
