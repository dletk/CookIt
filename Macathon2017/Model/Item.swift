//
//  Item.swift
//  Macathon2017
//
//  Created by Duc Le on 11/10/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

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

class Item: Object {
    @objc dynamic var itemName: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var time: String = ""
    @objc dynamic var location: String = ""
//    @objc dynamic var dietaryInfo: [String] = []
    @objc dynamic var type: String = ""
    @objc dynamic var expectedNumOfServings: Int = 0
    @objc dynamic var serviceType: String = ""
    @objc dynamic var itemImage: NSData = NSData()
    @objc dynamic var address: String = ""
    
    convenience  init?(itemName: String, price: Double, location: String, address: String, type: String, expectedNumOfServings: Int, serviceType: String, itemImage: NSData, time: String) {
        if itemName == "" {
            return nil
        }
        
        self.init()
        
        self.itemName = itemName
        self.price = price
        self.location = location
        self.type = type
        self.expectedNumOfServings = expectedNumOfServings
        self.serviceType = serviceType
        self.itemImage = itemImage
        self.time = time
        self.address = address
    }
    
}
