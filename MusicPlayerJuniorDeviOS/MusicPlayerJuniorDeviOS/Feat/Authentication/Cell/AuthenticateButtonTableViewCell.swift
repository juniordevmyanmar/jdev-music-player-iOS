//
//  AuthenticateButtonTableViewCell.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 01/04/2023.
//

import UIKit

class AuthenticateButtonTableViewCell: BaseTableViewCell<AuthenticationButtonType> {

    @IBOutlet weak var authenticateButton: UIButton!
    var didTapLogin: ((AuthType) -> Void)?
    var didTapSignUp: ((AuthType) -> Void)?
    
    override func setUpUI() {
        super.setUpUI()
        authenticateButton.layer.cornerRadius = 4
        authenticateButton.addTarget(self, action: #selector(self.handleAuthenticateAction), for: .touchUpInside)
    }
    
    override func bindItem(_ item: AuthenticationButtonType) {
        super.bindItem(item)
        authenticateButton.setTitle(item.buttonTitle, for: .normal)
        authenticateButton.isEnabled = item.buttonState == .isEnabled ? true : false
        authenticateButton.layer.cornerRadius = 8
    }
    
    @objc func handleAuthenticateAction() {
        switch item?.authType {
        case .login:
            self.didTapLogin?(.login)
        case .signUp:
            self.didTapSignUp?(.signUp)
        default:
            break
        }
    }
    
    func handleConfirmAuthentication(completion: @escaping(AuthType) -> Void) {
        switch item?.authType {
        case .login:
            self.didTapLogin = completion
        case .signUp:
            self.didTapSignUp = completion
        default:
            break
        }
    }
    
}
