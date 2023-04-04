//
//  AuthInteractor.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 04/04/2023.
//

import Foundation

protocol AuthInteractorProtocol {
    var dataManager: AuthManagerProtocol? { get set }
    func login(email: String, password: String)
    func signUp(model: RegisterModel)
}

class AuthInteractor: AuthInteractorProtocol {
    var dataManager: AuthManagerProtocol?
    
    func login(email: String, password: String) {
        self.dataManager?.login(email: email, password: password)
    }
    
    func signUp(model: RegisterModel) {
        self.dataManager?.signUp(model: model)
    }
}
