//
//  DataStore.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation

struct DataStore {
    
    struct Keys {
        public static let apiKey = "api_key"
    }
    
    static var shared = DataStore()
    
    private init() {}
    
    let userDefaults = UserDefaults.standard
    
    var token: String {
        get {
            return userDefaults.string(forKey: Keys.apiKey) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: Keys.apiKey)
        }
    }
}
