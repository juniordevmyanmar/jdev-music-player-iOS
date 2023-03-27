//
//  InputType.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 27/03/2023.
//

import Foundation

enum InputType: SectionItem {
    case email
    case fullName
    case password
    case confirmPassword
    case phoneNumber
    case none
    
    var titleLabel: String {
        switch self {
        case .email:
            return "Email"
        case .fullName:
            return "Full Name"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        case .phoneNumber:
            return "Phone Number"
        case .none:
            return ""
        }
    }
}
