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
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginAuthenticationCell.className, for: indexPath) as? LoginAuthenticationCell else {
            return UITableViewCell()
        }
        
        cell.item = self.sections[indexPath.section].items[indexPath.row].toType(InputType.self)
        
        cell.handleDoneAction { inputText, inputType in
            switch inputType {
            case .email:
                debugPrint("Carry out email validation")
            case .fullName:
                debugPrint("Carry out email validation")
            case .password:
                debugPrint("Carry out email validation")
            case .confirmPassword:
                debugPrint("Carry out email validation")
            case .phoneNumber:
                debugPrint("Carry out email validation")
            case .none:
                debugPrint("Carry out email validation")
            }
        }
        
        return cell
    }
}
