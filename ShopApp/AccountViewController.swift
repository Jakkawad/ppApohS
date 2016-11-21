//
//  AccountViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 10/28/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var titleSection1 = ["ผู้แนะนำ", "อีเมล์", "ชื่อนามสกุล", "ที่อยู่จัดส่ง", "เปลี่ยนรหัสผ่าน"]
    var titleSection2 = ["ธนาคาร", "ชื่อบัญชี", "เลขบัญชี", "สาขา", "เบอร์มือถือ"]
    
    let gridFlowLayout = GridFlowLayout()
    
    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            
        }
    }
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    func setupGrid() {
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: false)
    }
    
    func setupInitialLayout() {
        isGridFlowLayoutUsed = true
        collectionView.collectionViewLayout = gridFlowLayout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: tableCell0, for: indexPath)
        return cell0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Collection Layout
        setupGrid()
        isGridFlowLayoutUsed = true
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
