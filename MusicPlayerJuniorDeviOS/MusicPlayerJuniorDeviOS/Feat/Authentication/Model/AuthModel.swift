//
//  AuthModel.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation

struct AuthLoginNetworkModel: Codable {
    let token: String?
}

class LoginModel {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

class RegisterModel {
    var name: String
    var email: String
    var password: String
    var address: String
    var phoneNumber: String?
    var dateOfBirth: String?
    
    init(name: String, email: String, password: String, address: String, phoneNumber: String? = nil, dateOfBirth: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.address = address
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
    }
}
