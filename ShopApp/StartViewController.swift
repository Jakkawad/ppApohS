//
//  StartViewController.swift
//  ShopApp
//
//  Created by Jakkawad Chaiplee on 11/26/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var imageViewBackground: UIImageView!
    
    @IBAction func btnRegister(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "RegisterSegue", sender: nil)
    }
    
    @IBAction func btnLogin(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    @IBAction func btnLoginWithFB(_ sender: UITapGestureRecognizer) {
//        performSegue(withIdentifier: "StartSegue", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "StartSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageViewBackground!.alpha = 0.5
        
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
