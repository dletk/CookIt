//
//  ItemManager.swift
//  Macathon2017
//
//  Created by Duc Le on 11/11/17.
//  Copyright © 2017 Duc Le. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

let itemManager = ItemManager()

class ItemManager {
    let realm = try! Realm()
    
    public func getItemsByLocation(location: String) -> [Item] {
        return Array(realm.objects(Item.self)).filter({$0.location == location})
    }
    
    public func getAllItems() -> [Item] {
        return Array(realm.objects(Item.self))
    }
    
    public func addNewItem(item: Item) {
        try! realm.write {
            realm.add(item)
        }
    }
}
