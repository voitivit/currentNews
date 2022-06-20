//
//  AuthRealmModel.swift
//  currentNews
//
//  Created by emil kurbanov on 15.06.2022.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var login: String = ""
    @objc dynamic var password: String = ""
    
    override static func primaryKey() -> String? {
        return "login"
    }
}
