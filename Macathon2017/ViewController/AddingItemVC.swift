//
//  AddingItemVC.swift
//  Macathon2017
//
//  Created by Nam Phung on 11/11/2017.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class AddingItemVC: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var servingTextField: UITextField!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        itemImageView.isUserInteractionEnabled = true
        itemImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        return
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        // Get all info and create a new item to the database
        guard let itemName = itemTextField.text else {
            fatalError()
        }
        guard let time = timeTextField.text else {
            fatalError()
        }
        guard let location = locationTextField.text else {
            fatalError()
        }
        guard let price = priceTextField.text else {
            fatalError()
        }
        guard let servings = servingTextField.text else {
            fatalError()
        }
        guard let image = itemImageView.image else {
            fatalError()
        }
        
        var type: ItemType
        var service: ServiceType
        
        switch typeButton.currentTitle! {
        case "Entree":
            type = .entree
        case "Desert":
            type = .desert
        default:
            type = .appertizer
        }
        
        switch serviceButton.currentTitle! {
        case "Pick up":
            service = .pick_up
        case "Eat in":
            service = .eat_in
        default:
            service = .delivery
        }
        
        let newItem = Item(itemName: itemName, price: Double(price)!, location: location, dietaryInfo: [], type: type, expectedNumOfServings: Int(servings)!, serviceType: service, itemImage: image, time: time)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func typeButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Type selection", message: "Please choose the type of your item", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of types of item
        for type in ItemType.allItemTypes {
            let typeAction = UIAlertAction(title: type.rawValue, style: .default, handler: {(actionSender) in
                sender.setTitle(type.rawValue, for: .normal)
            })
            alertController.addAction(typeAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func serviceButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Service selection", message: "Please choose the type of your item", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of types of item
        for type in ServiceType.allServiceType {
            let typeAction = UIAlertAction(title: type.rawValue, style: .default, handler: {(actionSender) in
                sender.setTitle(type.rawValue, for: .normal)
            })
            alertController.addAction(typeAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
