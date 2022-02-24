//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Roman Zhukov on 24.02.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
}

extension StorageManager {
    func saveName(name: String) {
        UserDefaults.standard.set(name, forKey: "name")
    }
    
    func getName() -> String {
        guard let name = UserDefaults.standard.object(forKey: "name") as? String else { return "" }
        return name
    }
    
    func deleteName() {
        UserDefaults.standard.removeObject(forKey: "name")
    }
}
