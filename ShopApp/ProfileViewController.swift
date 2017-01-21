//
//  ProfileViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/21/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProfileTableViewCellDelegate {

    var titleArray = ["ชื่อโปรไฟล์", "อีเมล", "ชื่อ-นามสกุล", "ที่อยู่", "แขวง/ตำบล", "เขต/อำเภอ", "จังหวัด", "รหัสไปรษณีย์", "เบอร์โทรศัพท์"]
    
    @IBOutlet weak var tableView:UITableView!
    
    func returnValueText(string: String, number: Int) {
//        print("Text: \(string)")
//        print("Number: \(number)")
        print("Edit: \(titleArray[number]) value: \(string)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? ProfileTableViewCell
        cell0?.lblTitle.text = titleArray[indexPath.row]
        cell0?.delegate = self
        cell0?.numberOfArray = indexPath.row
        return cell0!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
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
