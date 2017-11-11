//
//  SellerMainVC.swift
//  Macathon2017
//
//  Created by Nam Phung on 10/11/2017.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class SellerMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let item1  = Item(itemName: "Chicken", price: 12.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 2, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example1"))
    let item2  = Item(itemName: "Pho", price: 9.0, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 6, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example2"))
    let item3  = Item(itemName: "Banh xeo", price: 13.1, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 4, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example3"))
    let item4  = Item(itemName: "Pho", price: 7.7, location: "Saint Paul", dietaryInfo: [DietaryInfo.peanut_watch], type: "Entree", expectedNumOfServings: 12, serviceType: ServiceType.pick_up, itemImage: #imageLiteral(resourceName: "example4"))
    private var listItems: [Item] = []
    
    @IBOutlet weak var currentOfferItemsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentOfferItemsTableView.delegate = self
        currentOfferItemsTableView.dataSource = self
        listItems.append(item1)
        listItems.append(item2)
        listItems.append(item3)
        listItems.append(item4)
        
        // Set up the adding button bar button item on the right
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action:#selector(addButtonAction(rightButton:)))

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sellItemCell", for: indexPath) as? ItemSellCell else {
            fatalError("Cannot deque the cell")
        }
        let item = listItems[indexPath.row]
        
        cell.itemName.text = item.itemName
        cell.itemPriceLabel.text = String(item.price)
        cell.itemServingLabel.text = String(item.expectedNumOfServings)
        cell.itemType.text = item.type
        cell.itemImage.image = item.itemImage
        
        
        return cell
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
