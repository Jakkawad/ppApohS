//
//  AccountViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var titleArray = ["ข้อมูลส่วนตัว", "เปลี่ยนรหัสผ่าน", "สั่งซื้อของฉัน", "ข้อมูลธุรกรรม", "ประวัติธุรกรรม", "รายการโปรด", "แจ้งเตือน", "ตั้งค่าใช้งาน", "ออกจากระบบ"]
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell0, for: indexPath) as? AccountCollectionViewCell
        cell0?.lblTitle.text = titleArray[indexPath.row]
        return cell0!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "ProfileSegue", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "PasswordSegue", sender: self)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "MyPurchaseSegue", sender: self)
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "PaymentSegue", sender: self)
        } else if indexPath.row == 4 {
            
        } else {
            
        }
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
