//
//  AuthPresenter.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 04/04/2023.
//

import Foundation

protocol AuthPresenterProtocol {
    var view: AuthViewProtocol? { get set }
    func didLoginSuccess(model: AuthLoginNetworkModel)
    func didRegisterSuccess(model: AuthLoginNetworkModel)
    func didGetError(error: ErrorResponse)
}

class AuthPresenter: AuthPresenterProtocol {
   var view: AuthViewProtocol?
    
    func didLoginSuccess(model: AuthLoginNetworkModel) {
        view?.didLoginSuccess(model: model)
    }
    
    func didRegisterSuccess(model: AuthLoginNetworkModel) {
        view?.didRegisterSuccess(model: model)
    }
    
    func didGetError(error: ErrorResponse) {
        view?.didGetError(error: error)
    }
}
