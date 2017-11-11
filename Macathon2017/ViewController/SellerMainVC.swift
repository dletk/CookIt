//
//  SellerMainVC.swift
//  Macathon2017
//
//  Created by Nam Phung on 10/11/2017.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class SellerMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    let item1  = Item(itemName: "Chicken", price: 12.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: .desert, expectedNumOfServings: 2, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example1"), time: "5pm")
//    let item2  = Item(itemName: "Pho", price: 9.0, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: .entree, expectedNumOfServings: 6, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example2"), time: "7pm")
//    let item3  = Item(itemName: "Banh xeo", price: 13.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: .entree, expectedNumOfServings: 4, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example3"), time: "4:30pm")
//    let item4  = Item(itemName: "Pho", price: 7.7, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: .appertizer, expectedNumOfServings: 12, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example4"), time: "6pm")
    private var listItems: [Item] = []
    
    @IBOutlet weak var currentOfferItemsTableView: UITableView!
    
    @IBOutlet weak var previousOfferItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        listItems.append(item1)
//        listItems.append(item2)
//        listItems.append(item3)
//        listItems.append(item4)
        listItems = itemManager.getAllItems()
        // Set up the adding button bar button item on the right
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action:#selector(addButtonAction(rightButton:)))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Deal with the tableView to reload the proper data
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.tabBarController?.selectedIndex == 0 {
            listItems = itemManager.getAllItems()
            currentOfferItemsTableView.reloadData()
            // Only retrieve the items that seller is offering now
        } else {
            listItems = itemManager.getAllItems()
            previousOfferItemsTableView.reloadData()
            // Only retrieve the items that seller has offered before
        }
    }
    
    @objc func addButtonAction(rightButton: UIBarButtonItem) {
        return
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.tabBarController?.selectedIndex == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sellItemCell", for: indexPath) as? ItemSellCell else {
                fatalError("Cannot deque the cell")
            }
            let item = listItems[indexPath.row]
        
            cell.itemName.text = item.itemName
            cell.itemPriceLabel.text = String(item.price)
            cell.itemServingLabel.text = String(item.expectedNumOfServings)
            cell.itemType.text = item.type
            cell.itemImage.image = UIImage(data: item.itemImage as Data)
        
        
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "previousSellCell", for: indexPath) as? PreviousItemSellCell else {
                fatalError("Cannot deque the cell")
            }
            let item = listItems[indexPath.row]
            
            cell.itemName.text = item.itemName
            cell.itemPriceLabel.text = String(item.price)
            cell.itemServingLabel.text = String(item.expectedNumOfServings)
            cell.itemType.text = item.type
            cell.itemImage.image = UIImage(data: item.itemImage as Data)
            
            return cell
        }
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
