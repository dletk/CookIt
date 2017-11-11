//
//  BuyerItemDetailsVC.swift
//  Macathon2017
//
//  Created by Duc Le on 11/11/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class BuyerItemDetailsVC: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemTimeLabel: UILabel!
    @IBOutlet weak var itemAddressLabel: UILabel!
    @IBOutlet weak var itemLocationLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemServingLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var itemServiceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var item: Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = self.item {
            itemNameLabel.text = item.itemName
            itemPriceLabel.text = String(describing: item.price)
            itemTimeLabel.text = item.time
            itemTypeLabel.text = item.type
            itemServiceLabel.text = item.serviceType
            itemAddressLabel.text = item.address
            itemLocationLabel.text = item.location
            itemImageView.image = UIImage(data: item.itemImage as Data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTouched(_ sender: UIBarButtonItem) {
        let alertView = UIAlertController(title: "Please confirm", message: "Are you sure you want to buy this?", preferredStyle: .alert)
        let actionYES = UIAlertAction(title: "Yes, buy it", style: .default, handler: {(actionSender) in
            alertView.dismiss(animated: true, completion: nil)
        })
        let actionCancel = UIAlertAction(title: "No, cancel", style: .destructive, handler: {(actionSender) in
            alertView.dismiss(animated: true, completion: nil)
        })
        alertView.addAction(actionYES)
        alertView.addAction(actionCancel)
        
        self.present(alertView, animated: true, completion: nil)
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
