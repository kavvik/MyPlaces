//
//  StorageManager.swift
//  MyPlace
//
//  Created by a.koziukin on 01.12.2022.
//

import RealmSwift
import Darwin

let realm = try! Realm()
 

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}

