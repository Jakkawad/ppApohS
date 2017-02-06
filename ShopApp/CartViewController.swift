//
//  CartViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import FMDB
import Alamofire

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartTableViewCellDelegate {
    
    var products = [Product]()
    var productSelected: Product!
    // Price + Shipping
    var totalPrice: Double = 0
    var shipping: Double = 0
    var totalPriceWithShipping: Double = 0
    var priceToMember: Double = 0
    var priceToInvent: Double = 0
    
    var database:FMDatabase!
    var productInCart: [[String:String]] = []
    var numberOfArray: Int!
    // MARK: TableView
    @IBOutlet weak var tableView:UITableView!
    // MARK: UIView
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var lblTotalPriceWithShipping: UILabel!
    @IBOutlet weak var lblPriceToMember: UILabel!
    @IBOutlet weak var lblPriceToInvent: UILabel!
    
    func qulityNegative(qulity: Int, product_id: String) {
        print("qulity: \(qulity), product_id: \(product_id)")
        updateRow(id: product_id, qulity: qulity)
    }
    
    func qulityPlus(qulity: Int, product_id: String) {
        print("qulity: \(qulity), product_id: \(product_id)")
        updateRow(id: product_id, qulity: qulity)
    }

    // MARK: FMDB
    func openDB() {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = documentsFolder.appending("/cart.db")
        print("db path: \(path)")
        let fileManager = FileManager()
        if (!fileManager.fileExists(atPath: path)){
            let dbFilePath = Bundle.main.path(forResource: "cart", ofType: "db")!
            do{
                try fileManager.copyItem(atPath: dbFilePath, toPath: path)
            }catch{
                
            }
        }
        self.database = FMDatabase(path: path)
        self.database.open()
        self.query()
    }
    
    func query() {
        productInCart.removeAll()
        if let rs = database.executeQuery("SELECT product_id, product_qulity FROM cart", withArgumentsIn: nil) {
            
            while rs.next() {
                let product_id = rs.int(forColumn: "product_id")
                let product_qulity = rs.string(forColumn: "product_qulity")
                
                let item:[String:String] = [
                    "product_id":String(product_id),
                    "product_qulity":product_qulity!]
                productInCart.append(item)
            }
            self.tableView.reloadData()
        } else {
            print("select failed: \(database.lastErrorMessage())")
        }
//        loadJSON()
    }
    
    func updateRow(id: String, qulity: Int) {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = documentsFolder.appending("/cart.db")
        let contactDB = FMDatabase(path: path)
        if (contactDB?.open())! {
            defer {
                contactDB?.close()
            }
            do {
                try contactDB?.executeUpdate("UPDATE cart SET product_qulity=? WHERE product_id=?", values: [qulity, id])
            } catch {
                print("error update")
            }
        } else {
            print("error: \(contactDB?.lastErrorMessage())")
        }
    }
    
    func deleteRow(id: Int) {
        _ = database.executeUpdate("DELETE FROM cart WHERE product_id  = ?", withArgumentsIn: [id])
        query()
//        loadJSON()
        
    }
    
    // MARK: Alamofire
    func loadJSON() {
        products.removeAll()
        for result in productInCart {
//            print(result)
            let item = result as NSDictionary
            let product_id = item.object(forKey: "product_id")!
            Alamofire.request("http://a2b.mul.pw/api/v2/product/id/\(product_id)").responseJSON { response in
                if let result = response.result.value as? Dictionary<String, AnyObject> {
                    if let product = result["product"] as? [Dictionary<String, AnyObject>] {
//                    print(product)
                        for obj in product {
                            let product = Product(productDictionary: obj)
                            self.products.append(product)
//                        print("OBJ = \(obj)")
//                        print(product.name)
                        }
//                    self.products.remove(at: 0)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: TableView DataSource, Delegate
    func reloadArray() {
        query()
//        productInCart.removeAll()
        loadJSON()
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.section]
//        print("indexPath.section: \(indexPath.section)")
        var cart = productInCart[indexPath.section]
//        print("id: \(cart["product_id"])")
//        print("cart: \(cart["product_qulity"])")
        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? CartTableViewCell
        cell0?.product_qulity = Int(cart["product_qulity"]!)!
        cell0?.configureCell(product: product, qulity: Int(cart["product_qulity"]!)!)
        cell0?.selectionStyle = .none
//        cell0?.numberOfArray = indexPath.section
        cell0?.delegate = self
        return cell0!

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.section)
        let product = products[indexPath.section]
        productSelected = product
        performSegue(withIdentifier: "ProductDetailSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            let cart = self.productInCart[indexPath.section]
            let product_id = cart["product_id"]
            deleteRow(id: Int(product_id!)!)
            reloadArray()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        openDB()
        loadJSON()
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

//        openDB()
//        loadJSON()
        
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
//        deleteRow(id: 51)
//        tableView.allowsSelection = false
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
            let detailVC = segue.destination as? ProductDetailViewController
            detailVC?.product = productSelected
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
