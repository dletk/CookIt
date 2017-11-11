//
//  BuyerMainVC.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import UIKit

class BuyerMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var listItems: [Item] = []
    @IBOutlet weak var buyItemsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buyItemsTableView.delegate = self
        buyItemsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        
        
        
        return cell
    }
}

