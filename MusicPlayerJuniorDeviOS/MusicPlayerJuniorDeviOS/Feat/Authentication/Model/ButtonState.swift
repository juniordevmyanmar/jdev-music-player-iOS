//
//  ButtonState.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 01/04/2023.
//

import Foundation

struct AuthenticationButtonType {
    var buttonState: ButtonState
    var buttonTitle: String
    var authType: AuthType
}

enum ButtonState {
    case isEnabled
    case isDisabled
}
