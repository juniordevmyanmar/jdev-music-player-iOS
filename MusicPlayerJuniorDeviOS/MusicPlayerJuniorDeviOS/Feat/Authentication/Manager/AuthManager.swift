//
//  AuthManager.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation

protocol AuthManagerProtocol {
    var presenter: AuthPresenterProtocol? { get set }
    func login(email: String, password: String)
    func signUp(model: RegisterModel)
}

class AuthManager: AuthManagerProtocol {
   var presenter: AuthPresenterProtocol?
    
    func login(email: String, password: String) {
        let bodyParam: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        NetworkManager.shared.call(
            .login(bodyParam), dataType: AuthLoginNetworkModel.self) { [weak self] result in
                switch result {
                case .success(let res):
                    self?.presenter?.didLoginSuccess(model: res)
                case .failure(let err):
                    self?.presenter?.didGetError(error: err)
                }
            }
    }
    
    func signUp(model: RegisterModel) {
        
        let bodyParam: [String: Any] = [
            "name" : model.name,
            "email" : model.email,
            "password" : model.password,
            "address" : model.address,
            "phone": model.phoneNumber ?? "",
            "dateOfBirth" : model.dateOfBirth ?? ""
        ]
        
        NetworkManager.shared.call(
            .register(bodyParam), dataType: AuthLoginNetworkModel.self) { [weak self] result in
                switch result {
                case .success(let res):
                    self?.presenter?.didRegisterSuccess(model: res)
                case .failure(let err):
                    self?.presenter?.didGetError(error: err)
                }
            }
        
    }
}

