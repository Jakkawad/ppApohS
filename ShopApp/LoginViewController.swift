//
//  LoginViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/16/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func btnDismiss(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
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
