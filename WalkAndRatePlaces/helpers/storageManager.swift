//
//  storageManager.swift
//  WalkAndRatePlaces
//
//  Created by Mac on 14.04.2020.
//  Copyright © 2020 Alexey Barinov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class storageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write{
            realm.add(place)
        }
        
    }
    
    static func deleteObject(_ place: Place){
        
        try! realm.write{
            realm.delete(place)
        }
    }
}
