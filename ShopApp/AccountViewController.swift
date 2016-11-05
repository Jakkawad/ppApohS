//
//  AccountViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var titleSection1 = ["ผู้แนะนำ", "อีเมล์", "ชื่อนามสกุล", "ที่อยู่จัดส่ง", "เปลี่ยนรหัสผ่าน"]
    var titleSection2 = ["ธนาคาร", "ชื่อบัญชี", "เลขบัญชี", "สาขา", "เบอร์มือถือ"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  section == 0 {
            return titleSection1.count
        } else {
            return titleSection2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            cell0?.textLabel?.text = titleSection1[indexPath.row]
            return cell0!
        } else {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0)
            cell0?.textLabel?.text = titleSection2[indexPath.row]
            return cell0!
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "บัญชีส่วนตัว"
        } else {
            return "ข้อมูลธุรกรรม"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
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
