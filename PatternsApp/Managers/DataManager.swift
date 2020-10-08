//
//  DataManager.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

class DataManager {

    static let shared = DataManager()

    private let userDefaults = UserDefaults()

    private init() {}

    func saveFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }

    func loadFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
