//
//  User.swift
//  UserDefaultsFirstApp
//
//  Created by Stepan Vasilyeu on 3/2/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

struct User: Encodable, Decodable {
    var name = "User"
    var surname = "Name"
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
