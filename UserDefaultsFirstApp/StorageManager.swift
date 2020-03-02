//
//  StorageManager.swift
//  UserDefaultsFirstApp
//
//  Created by Stepan Vasilyeu on 3/2/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private var user = User()
    private let userDefaults = UserDefaults.standard
    
    func saveUser(_ user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userData, forKey: "userName")
    }
    
    func fetchUser() -> User {
        guard let userData = userDefaults.object(forKey: "userName") as? Data else { return user }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return self.user}
        return user
    }
}
