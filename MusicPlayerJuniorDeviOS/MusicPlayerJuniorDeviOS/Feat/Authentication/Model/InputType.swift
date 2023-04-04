//
//  InputType.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 27/03/2023.
//

import Foundation

struct InputFormField: SectionItem {
    var text: String
    var inputType: InputType
    var isSecureText: Bool
}

enum InputType: SectionItem {
    case email
    case fullName
    case password
    case confirmPassword
    case phoneNumber
    case dateOfBirth
    case none
    
    var titleLabel: String {
        switch self {
        case .email:
            return "Email"
        case .fullName:
            return "Username"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        case .phoneNumber:
            return "Phone Number"
        case .dateOfBirth:
            return "Date Of Birth"
        case .none:
            return ""
        }
    }
}
