//
//  LoginViewController.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import UIKit

protocol AuthViewProtocol {
    var interactor: AuthInteractorProtocol? { get set }
    func didLoginSuccess(model: AuthLoginNetworkModel)
    func didRegisterSuccess(model: AuthLoginNetworkModel)
    func didGetError(error: ErrorResponse)
}

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: DynamicSizeTableView!
    @IBOutlet weak var authSegmentControl: CustomSegmentedControl!
    
    var loginItems: [InputFormField] = [
        InputFormField(text: "", inputType: .email, isSecureText: false),
        InputFormField(text: "", inputType: .password, isSecureText: true)
    ]
    
    var signUpItems: [InputFormField] = [
        InputFormField(text: "", inputType: .email, isSecureText: false),
        InputFormField(text: "", inputType: .password, isSecureText: true),
        InputFormField(text: "", inputType: .confirmPassword, isSecureText: true),
        InputFormField(text: "", inputType: .phoneNumber, isSecureText: false),
        InputFormField(text: "", inputType: .dateOfBirth, isSecureText: false)
    ]
    
    var buttonModel: AuthenticationButtonType = AuthenticationButtonType(
        buttonState: .isEnabled, buttonTitle: "Login", authType: .login)
    
    var authType: AuthType {
        AuthType(rawValue: self.authSegmentControl.selectedSegmentIndex) ?? .login
    }
    
    var loginAuthModel = LoginModel(email: "", password: "")
    
    var registerAuthModel = RegisterModel(
        name: "", email: "",
        password: "", address: "",
        phoneNumber: "", dateOfBirth: ""
    )
    
    var interactor: AuthInteractorProtocol?
    
    override func setUpUI() {
        super.setUpUI()
        setUpTableView()
        titleLabel.font = .raleWay700(ofSize: 14)
        self.authSegmentControl.setTitle("Login", forSegmentAt: AuthType.login.rawValue)
        self.authSegmentControl.setTitle("Sign Up", forSegmentAt: AuthType.signUp.rawValue)
        self.authSegmentControl.addTarget(
            self, action: #selector(self.handleAuthSegmentAction(_:)),
            for: .valueChanged
        )
    }
    
    @objc func handleAuthSegmentAction(_ sender: CustomSegmentedControl) {
        switch authType {
        case .login:
            self.buttonModel.buttonTitle = "Login"
            self.buttonModel.authType = .login
            self.buttonModel.buttonState = .isEnabled
        case .signUp:
            self.buttonModel.buttonTitle = "Sign Up"
            self.buttonModel.authType = .signUp
            self.buttonModel.buttonState = .isEnabled
        }
        self.tableView.reloadSections(IndexSet([0, 1]), with: .automatic)
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        tableView.register(
            LoginAuthenticationCell.className,
            AuthenticateButtonTableViewCell.className
        )
    }
    
}

extension LoginViewController {
    
    func didTextChangeForLoginScreen(text: String, inputType: InputType, row: Int) {
        self.loginItems[row].text = text
        switch inputType {
        case .email:
            self.loginAuthModel.email = text
        case .password:
            self.loginAuthModel.password = text
        default:
            break
        }
    }
    
    func didTextChangeForSignUpScreen(text: String, inputType: InputType, row: Int) {
        self.signUpItems[row].text = text
        switch inputType {
        case .email:
            self.registerAuthModel.email = text
        case .password:
            self.registerAuthModel.password = text
        case .confirmPassword:
            debugPrint(text == self.registerAuthModel.password ? "Correct" : "Incorrect")
        case .phoneNumber:
            self.registerAuthModel.phoneNumber = text
        default:
            break
        }
    }
    
    func didSelectDateForSignUpScreen(text: String) {
        self.registerAuthModel.dateOfBirth = text
    }
    
    func didConfirmLogin() {
        if self.loginAuthModel.email.isEmpty || self.loginAuthModel.password.isEmpty {
            debugPrint("Login Fields are required")
        } else {
            interactor?.login(email: self.loginAuthModel.email, password: self.loginAuthModel.password)
        }
    }
    
    func didConfirmSignUp() {
        
        if self.registerAuthModel.email.isEmpty || self.registerAuthModel.password.isEmpty {
            debugPrint("Sign-Up Fields are required")
        } else {
            interactor?.signUp(model: RegisterModel(
                name: self.registerAuthModel.name, email: self.registerAuthModel.email,
                password: self.registerAuthModel.password, address: self.registerAuthModel.address)
            )
        }
    }
}

extension LoginViewController: AuthViewProtocol {
    
    func didLoginSuccess(model: AuthLoginNetworkModel) {
        
    }
    
    func didRegisterSuccess(model: AuthLoginNetworkModel) {
        
    }
    
    func didGetError(error: ErrorResponse) {
        
    }
}
