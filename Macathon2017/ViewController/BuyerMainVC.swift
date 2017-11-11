//
//  BuyerMainVC.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class BuyerMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let item1  = Item(itemName: "Chicken", price: 12.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 2, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example1"))
    let item2  = Item(itemName: "Pho", price: 9.0, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 6, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example2"))
    let item3  = Item(itemName: "Banh xeo", price: 13.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 4, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example3"))
    let item4  = Item(itemName: "Pho", price: 7.7, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 12, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example4"))
    private var listItems: [Item] = []
    @IBOutlet weak var buyItemsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buyItemsTableView.delegate = self
        buyItemsTableView.dataSource = self
        listItems.append(item1)
        listItems.append(item2)
        listItems.append(item3)
        listItems.append(item4)

        // Do any additional setup after loading the view.
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
        cell.itemImage.image = item.itemImage
        
        
        return cell
    }
}

