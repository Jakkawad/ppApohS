//
//  FilterViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/21/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

struct FilterOptionType {
    var sectionName: String!
    var sectionValue: [String]!
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterSliderTableViewCellDelegate {
    
    var priceLowerStart: Int!
    var priceUpperStart: Int!
    
    var priceLower: Int!
    var priceUpper: Int!
    
    var optionValue = ["Color":["Red", "Blue"], "Size":["S", "M"], "Animal":["Dog", "Cat"]]
    var optionType = [FilterOptionType]()
    var optionSegue = [String]()
    
    var optionSelectedRow: Int!
    
    var optionSelectValue1: String!
    var optionSelectValue2: String!
    var optionSelectValue3: String!
    var optionSelectValue4: String!
    var optionSelectValue5: String!
    
    @IBOutlet weak var tableView:UITableView!
    
    func rangeSlider(lower: Int, upper: Int) {
        print("lower: \(lower), upper: \(upper)")
        priceLower = lower
        priceUpper = upper
    }
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSend(_ sender: Any) {
        if priceLower == nil && priceUpper == nil {
            print("nil")
            priceLower = 100
            priceUpper = 9000
        }
        print("lower: \(priceLower), upper: \(priceUpper)")
        print("$$$$$$$$$")
        print("option1: \(optionSelectValue1)")
        print("option2: \(optionSelectValue2)")
        print("option3: \(optionSelectValue3)")
        print("option4: \(optionSelectValue4)")
        print("option5: \(optionSelectValue5)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unWindFilterOptionValue(segue: UIStoryboardSegue) {
        if let filterOptionVC = segue.source as? FilterOptionViewController {
            let index = filterOptionVC.tableView.indexPathForSelectedRow
            let cell = filterOptionVC.tableView.cellForRow(at: index!)
            let msg = cell?.textLabel?.text
//            print(msg!)
            let selectedRow = filterOptionVC.optionSelected
            print("selectedRow: \(selectedRow)")
            if selectedRow == 0 {
                optionSelectValue1 = msg
            } else if selectedRow == 1 {
                optionSelectValue2 = msg
            } else if selectedRow == 2 {
                optionSelectValue3 = msg
            } else if selectedRow == 3 {
                optionSelectValue4 = msg
            } else {
                optionSelectValue5 = msg
            }
            let indexPath = IndexPath(item: selectedRow!, section: 1)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return optionValue.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? FilterSliderTableViewCell
            cell0?.delegate = self
            cell0?.selectionStyle = .none
            return cell0!
        } else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell1)
            cell1?.textLabel?.text = optionType[indexPath.row].sectionName
            if indexPath.row == 0 {
                cell1?.detailTextLabel?.text = optionSelectValue1
            } else if indexPath.row == 1 {
                cell1?.detailTextLabel?.text = optionSelectValue2
            } else if indexPath.row == 2 {
                cell1?.detailTextLabel?.text = optionSelectValue3
            } else if indexPath.row == 3 {
                cell1?.detailTextLabel?.text = optionSelectValue4
            } else {
                cell1?.detailTextLabel?.text = optionSelectValue5
            }
            return cell1!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 72
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ราคา"
        } else {
            return "ลักษณะเฉพาะ"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
//                print("Section: 1, Row: 0")
                optionSelectedRow = indexPath.row
//                print("selected: \(optionSelectedRow)")
                optionSegue = optionType[indexPath.row].sectionValue
                performSegue(withIdentifier: "FilterOptionSegue", sender: nil)
            } else if indexPath.row == 1 {
//                print("Section: 1, Row: 1")
                optionSelectedRow = indexPath.row
//                print("selected: \(optionSelectedRow)")
                optionSegue = optionType[indexPath.row].sectionValue
                performSegue(withIdentifier: "FilterOptionSegue", sender: nil)
            } else if indexPath.row == 2 {
                optionSelectedRow = indexPath.row
//                print("selected: \(optionSelectedRow)")
                optionSegue = optionType[indexPath.row].sectionValue
                performSegue(withIdentifier: "FilterOptionSegue", sender: nil)
            } else if indexPath.row == 3 {
                optionSelectedRow = indexPath.row
//                print("selected: \(optionSelectedRow)")
                optionSegue = optionType[indexPath.row].sectionValue
                performSegue(withIdentifier: "FilterOptionSegue", sender: nil)
            } else {
                optionSelectedRow = indexPath.row
//                print("selected: \(optionSelectedRow)")
                optionSegue = optionType[indexPath.row].sectionValue
                performSegue(withIdentifier: "FilterOptionSegue", sender: nil)
            }
        } else {
            print("Section: 0")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        for (key, value) in optionValue {
            optionType.append(FilterOptionType(sectionName: key, sectionValue: value))
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
        if segue.identifier == "FilterOptionSegue" {
            let filterOptionVC = segue.destination as? FilterOptionViewController
            filterOptionVC?.optionSelected = optionSelectedRow
            filterOptionVC?.optionValue = optionSegue
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
