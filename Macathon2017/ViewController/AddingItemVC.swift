//
//  AddingItemVC.swift
//  Macathon2017
//
//  Created by Nam Phung on 11/11/2017.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class AddingItemVC: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var servingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SellerMainVC", sender: <#T##Any?#>)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
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
