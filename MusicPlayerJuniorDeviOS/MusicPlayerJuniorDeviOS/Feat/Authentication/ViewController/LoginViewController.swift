//
//  LoginViewController.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let sections: [LoginSections] = [
        LoginSections(items: [InputType.email, InputType.password])
    ]
    
    override func setUpUI() {
        super.setUpUI()
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        tableView.register(
            String(describing: LoginAuthenticationCell.className)
        )
    }
    
}
