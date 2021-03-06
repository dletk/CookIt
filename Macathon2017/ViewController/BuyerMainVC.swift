//
//  BuyerMainVC.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class BuyerMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    let item1  = Item(itemName: "Chicken", price: 12.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch.rawValue], type: ItemType.desert.rawValue, expectedNumOfServings: 2, serviceType: ServiceType.pick_up.rawValue, itemImage: #imageLiteral(resourceName: "example1"), time: "5pm")
//    let item2  = Item(itemName: "Pho", price: 9.0, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch.rawValue], type: ItemType.entree.rawValue, expectedNumOfServings: 6, serviceType: ServiceType.pick_up.rawValue, itemImage: #imageLiteral(resourceName: "example2"), time: "7pm")
//    let item3  = Item(itemName: "Banh xeo", price: 13.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch.rawValue], type: ItemType.entree.rawValue, expectedNumOfServings: 4, serviceType: ServiceType.pick_up.rawValue, itemImage: #imageLiteral(resourceName: "example3"), time: "4:30pm")
//    let item4  = Item(itemName: "Pho", price: 7.7, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch.rawValue], type: ItemType.appertizer.rawValue, expectedNumOfServings: 12, serviceType: ServiceType.pick_up.rawValue, itemImage: #imageLiteral(resourceName: "example4"), time: "6pm")
    private var listItems: [Item] = []
    @IBOutlet weak var buyItemsTableView: UITableView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyItemsTableView.delegate = self
        buyItemsTableView.dataSource = self
//        listItems.append((item1)!)
//        listItems.append(item2!)
//        listItems.append(item3!)
//        listItems.append(item4!)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buyItemsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemBuyerCell", for: indexPath) as? ItemBuyCell else {
            fatalError("Cannot deque the cell")
        }
        let item = listItems[indexPath.row]
        cell.itemName.text = item.itemName
        cell.itemPriceLabel.text = String(item.price)
        cell.itemServingLabel.text = String(item.expectedNumOfServings)
        cell.itemTypeLabel.text = item.type
        cell.itemImage.image = UIImage(data: item.itemImage as Data)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BuyerToDetailsSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let indexPath = buyItemsTableView.indexPathForSelectedRow else {
            fatalError()
        }
        let item = listItems[indexPath.row]
        if segue.identifier == "BuyerToDetailsSegue" {
            if let destination = segue.destination as? BuyerItemDetailsVC {
                destination.item = item
            }
        }
    }
    
    @IBAction func locationButtonTouched(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Location", message: "Choose a location", preferredStyle: .alert)
        // Here we need to retrieve the data from server to get the list of locations
        let listLocations = ["Macalester", "Saint Paul", "Mineapollis"]
        for location in listLocations {
            let locationAction = UIAlertAction(title: location, style: .default, handler: {(actionSender) in
                sender.setTitle(location, for: .normal)
                self.listItems = itemManager.getItemsByLocation(location: location)
                self.buyItemsTableView.reloadData()
            })
            alertController.addAction(locationAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {(actionSender) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        // Here to server also needs to provide us the corresponding list of item of the chosen location
        // TODO: Refresh the list of dishes as well.
    }
}

