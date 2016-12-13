//
//  ProductDetailViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import ImageSlideshow

class ProductDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate?
    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!, ImageSource(imageString: "427-cobra")!]

    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet var slideshow: ImageSlideshow!
    
    // MARK: Function
    
    @IBAction func addToCart(_ sender: UIButton) {
        print("Add to the cart")
        performSegue(withIdentifier: "SelectOption", sender: self)
    }
    
    @IBAction func shareWithFriends(_ sender: UIButton) {
        print("Share with friends")
//        let modalViewController = CustomModalViewController()
//        modalViewController.modalPresentationStyle = .overCurrentContext
//        present(modalViewController, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as?
            ProductDetailCell0TableViewCell
            cell0?.btnAction.backgroundColor = UIColor.red
            cell0?.btnAction.addTarget(self, action: #selector(ProductDetailViewController.addToCart(_:)), for: .touchUpInside)
            return cell0!
        } else if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: tableCell0) as? ProductDetailCell0TableViewCell
            cell1?.btnAction.backgroundColor = UIColor.blue
            cell1?.btnAction.addTarget(self, action: #selector(ProductDetailViewController.shareWithFriends(_:)), for: .touchUpInside)
            return cell1!
        } else if indexPath.row == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: tableCell1) as? ProductDetailCell1TableViewCell
            cell2?.lblDetail.text = "Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16 เมื่อเครื่องพิมพ์โนเนมเครื่องหนึ่งนำรางตัวพิมพ์มาสลับสับตำแหน่งตัวอักษรเพื่อทำหนังสือตัวอย่าง Lorem Ipsum อยู่ยงคงกระพันมาไม่ใช่แค่เพียงห้าศตวรรษ แต่อยู่มาจนถึงยุคที่พลิกโฉมเข้าสู่งานเรียงพิมพ์ด้วยวิธีทางอิเล็กทรอนิกส์ และยังคงสภาพเดิมไว้อย่างไม่มีการเปลี่ยนแปลง มันได้รับความนิยมมากขึ้นในยุค ค.ศ. 1960 เมื่อแผ่น Letraset วางจำหน่ายโดยมีข้อความบนนั้นเป็น Lorem Ipsum และล่าสุดกว่านั้น คือเมื่อซอฟท์แวร์การทำสื่อสิ่งพิมพ์ (Desktop Publishing) อย่าง Aldus PageMaker ได้รวมเอา Lorem Ipsum เวอร์ชั่นต่างๆ เข้าไว้ในซอฟท์แวร์ด้วย"
            
            return cell2!
        } else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: tableCell2) as? ProductDetailCell3TableViewCell
            return cell3!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        } else if indexPath.row == 1 {
            return 44
        } else if indexPath.row == 2 {
            return 150
//            return UITableViewAutomaticDimension
        } else if indexPath.row == 3 {
            return 220
        } else {
            return  50
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // JSON
        
        // TableView no border
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        
        //
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray;
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black;
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        slideshow.setImageInputs(localSource)
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
