//
//  AddShippingViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/18/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class AddShippingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var titleArray = ["ชื่อ-นามสกุล", "ที่อยู่", "แขวง/ตำบล", "เขต/อำเภอ", "จังหวัด", "รหัสไฟรษณีย์", "เบอร์โทรศัพท์"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnSave(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
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
