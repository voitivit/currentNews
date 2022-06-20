//
//  RealmConfig.swift
//  currentNews
//
//  Created by emil kurbanov on 20.06.2022.
//

import Foundation
import RealmSwift

class RealmConfig {
    
    var config = Realm.Configuration(schemaVersion: 1)
    var realm = try? Realm()
     
}
