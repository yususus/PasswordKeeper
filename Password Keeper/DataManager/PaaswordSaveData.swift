//
//  PaaswordSaveData.swift
//  Password Keeper
//
//  Created by yusuf on 5.08.2024.
//

import Foundation

class PasswordSaveData {
    private let itemsKey = "savedItems"

    func saveItem(name: String, password: String) {
        var items = fetchItems()
        items[name] = password
        UserDefaults.standard.set(items, forKey: itemsKey)
    }

    func fetchItems() -> [String: String] {
        return UserDefaults.standard.dictionary(forKey: itemsKey) as? [String: String] ?? [:]
    }

    func deleteItem(name: String) {
        var items = fetchItems()
        items.removeValue(forKey: name)
        UserDefaults.standard.set(items, forKey: itemsKey)
    }
}
