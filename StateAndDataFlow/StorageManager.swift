//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Buba on 17.12.2022.
//

import Foundation

class StorageManager {
    private let userDefaults = UserDefaults.standard
    
    func logIn(_ name: String) {
        userDefaults.set(name, forKey: "test")
    }
    
    func takeName() -> String {
        guard let name = userDefaults.string(forKey: "test") else { return ""}
        return name
    }
    
    func logOut() {
        userDefaults.removeObject(forKey: "test")
    }
    
    func test() -> Bool {
        if userDefaults.string(forKey: "test") != nil {
            return true
        } else {
            return false
        }
    }
}
