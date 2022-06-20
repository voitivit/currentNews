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
    
    convenience required init(login: String, password: String) {
        self.init()
        self.login = login
        self.password = password
    }
    
    override static func primaryKey() -> String? {
        return "login"
    }
}
