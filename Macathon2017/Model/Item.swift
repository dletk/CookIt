//
//  Item.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import Foundation
import UIKit

enum ServiceType {
    case pick_up
    case delivery
    case eat_in
}

enum DietaryInfo: String {
    case vegan = "vegan"
    case halal = "halal"
    case seafood_watch = "seafood"
    case peanut_watch = "peanut"
}

class Item {
    var itemName: String
    var price: Double
    var location: String
    var dietaryInfo: [DietaryInfo]
    var type: String
    var expectedNumOfServings: Int
    var serviceType: ServiceType
    var itemImage: UIImage
    
    init(itemName: String, price: Double, location: String, dietaryInfo: [DietaryInfo], type: String, expectedNumOfServings: Int, serviceType: ServiceType, itemImage: UIImage) {
        self.itemName = itemName
        self.price = price
        self.location = location
        self.type = type
        self.expectedNumOfServings = expectedNumOfServings
        self.serviceType = serviceType
        self.dietaryInfo = dietaryInfo
        self.itemImage = itemImage
    }
    
}
