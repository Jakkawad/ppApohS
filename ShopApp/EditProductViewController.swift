//
//  EditProductViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/23/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

protocol EditProductViewControllerDelegate {
    func getQulity(qulity: Int)
}

class EditProductViewController: UIViewController  {

    var delegate: EditProductViewControllerDelegate?
    
    var qulity: Int = 1
    
    
    @IBAction func btnClose(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var txtQulity: UITextField!
    
    @IBAction func btnPlus(_ sender: Any) {
        qulity += 1
        txtQulity.text = String(qulity)
    }
    
    @IBAction func btnNegative(_ sender: Any) {
        if qulity == 1 {
            
        } else {
            qulity -= 1
            txtQulity.text = String(qulity)
        }
    }
    
    @IBAction func btnApply(_ sender: Any) {
        delegate?.getQulity(qulity: qulity)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtQulity.text = String(qulity)
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(blurEffectView)
        
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
