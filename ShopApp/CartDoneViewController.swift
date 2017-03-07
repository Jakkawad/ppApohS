//
//  CartDoneViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 1/19/2560 BE.
//  Copyright © 2560 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class CartDoneViewController: UIViewController {

    @IBAction func btnGoHome(_ sender: UIBarButtonItem) {
        print("done")
//        performSegue(withIdentifier: "GoHomeSegue", sender: nil)
//        _ = navigationController?.popToRootViewController(animated: true)
//        navigationController?.popToRootViewController(animated: true)
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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
