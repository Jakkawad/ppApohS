//
//  EditProductViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/14/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class EditProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {

    var optionArray = ["color", "size"]
    var colorArray = ["Red", "Blue", "Green"]
    var sizeArray = ["S", "M", "L"]
    
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBAction func btnDone(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//        self.performSegue(withIdentifier: "SegueModal", sender: self)
        
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
//        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
//        if section == 0 {
//            return 1
//        } else if section == 1 {
//            return 3
//        } else {
//            return 2
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            return cell0!
        } else if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell1) as! EditProductTableViewCell0
            return cell1
        } else if indexPath.row == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell2)
            return cell2!
        } else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: tableCell3)
            return cell3!
        }
//        if indexPath.section == 0 {
//            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
//            return cell0!
//        } else if indexPath.section == 1 {
//            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell1)
//            return cell1!
//        } else {
//            if indexPath.row == 0 {
//                let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell2)
//                return cell2!
//            } else {
//                let cell3 = tableView.dequeueReusableCell(withIdentifier: tableCell3)
//                return cell3!
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        } else if indexPath.row == 1 {
            return 90
        } else if indexPath.row == 2 {
            return 90
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }
        return 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "SegueModal" {
//            let modalViewController = segue.destination as! CustomModalViewController
//            let controller = modalViewController.popoverPresentationController
//            if controller != nil {
//                controller?.delegate = self
//            }
//        }
    }
    
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle
//    {
//        return .none
//    }
    

}
