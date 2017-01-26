//
//  SortViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/20/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol SortViewControllerDelegate {
    func getSort(string: String)
}

class SortViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var delegate: SortViewControllerDelegate? = nil
    
    var titleArray = ["ราคาจากน้อยไปมาก", "ราคาจากมากไปน้อย", "เรียงตามอันดับตัวอักษร A-Z", "เรียงตามอันดับตัวอักษร Z-A"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
        cell0?.textLabel?.text = titleArray[indexPath.row]
        return cell0!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(titleArray[indexPath.row])
        delegate?.getSort(string: titleArray[indexPath.row])
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sort By"
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
