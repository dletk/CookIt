//
//  Item.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import Foundation
import UIKit

enum ServiceType: String {
    case pick_up = "Pick up"
    case delivery = "Delivery"
    case eat_in = "Eat in"
    
    static let allServiceType = [pick_up, delivery, eat_in]
}

enum DietaryInfo: String {
    case vegan = "vegan"
    case halal = "halal"
    case seafood_watch = "seafood"
    case peanut_watch = "peanut"
    
    static let allDietaryInfo = [vegan, halal, seafood_watch, peanut_watch]
}

enum ItemType: String {
    case entree = "Entree"
    case desert = "Desert"
    case appertizer = "Appertizer"
    
    static let allItemTypes = [entree, desert, appertizer]
}

class Item {
    var itemName: String
    var price: Double
    var time: String
    var location: String
    var dietaryInfo: [DietaryInfo]
    var type: ItemType
    var expectedNumOfServings: Int
    var serviceType: ServiceType
    var itemImage: UIImage
    
    init(itemName: String, price: Double, location: String, dietaryInfo: [DietaryInfo], type: ItemType, expectedNumOfServings: Int, serviceType: ServiceType, itemImage: UIImage, time: String) {
        self.itemName = itemName
        self.price = price
        self.location = location
        self.type = type
        self.expectedNumOfServings = expectedNumOfServings
        self.serviceType = serviceType
        self.dietaryInfo = dietaryInfo
        self.itemImage = itemImage
        self.time = time
    }
    
}
