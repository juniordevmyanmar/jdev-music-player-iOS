//
//  LoginView+TableView.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 27/03/2023.
//

import Foundation
import UIKit

extension LoginViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch authType {
        case .login:
            return section == 0 ? loginItems.count : 1
        case .signUp:
            return section == 0 ? signUpItems.count : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginAuthenticationCell.className, for: indexPath) as? LoginAuthenticationCell else {
                return UITableViewCell()
            }
            
            switch authType {
            case .login:
                cell.item = self.loginItems[indexPath.row]
                cell.row = indexPath.row
                cell.handleDoneAction { text, inputType, row in
                    self.didTextChangeForLoginScreen(text: text, inputType: inputType, row: row)
                }
            case .signUp:
                cell.item = self.signUpItems[indexPath.row]
                cell.row = indexPath.row
                cell.handleDateSelction { self.didSelectDateForSignUpScreen(text: $0) }
                cell.handleDoneAction { text, inputType, row in
                    self.didTextChangeForSignUpScreen(text: text, inputType: inputType, row: row)
                }
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AuthenticateButtonTableViewCell.className, for: indexPath) as? AuthenticateButtonTableViewCell else {
                return UITableViewCell()
            }
            cell.item = self.buttonModel
            cell.handleConfirmAuthentication {
                switch $0 {
                case .login:
                    self.didConfirmLogin()
                case .signUp:
                    self.didConfirmSignUp()
                }
            }
            return cell
        }
    }
}
