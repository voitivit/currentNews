//
//  AuthRealm.swift
//  currentNews
//
//  Created by emil kurbanov on 20.06.2022.
//

import Foundation
import RealmSwift

class AuthRealm: RealmConfig {
    
    func addUser(_ user: User) {
        do {
            realm?.beginWrite()
            realm?.add(user)
            try realm?.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func searchLogin(_ user: User) -> Bool {
        let addUser = realm?.object(ofType: User.self, forPrimaryKey: user.login)
        guard let addUser = addUser else {
            return false
        }
        
        if addUser.password == user.password {
            return true
        } else {
            addPassword(user: addUser, newPassword: user.password)
            return true
        }
    }
    
    func addPassword(user: User, newPassword: String ) {
        do {
            realm?.beginWrite()
            user.password = newPassword
            try realm?.commitWrite()
        } catch {
            print(error)
        }
    }
}

