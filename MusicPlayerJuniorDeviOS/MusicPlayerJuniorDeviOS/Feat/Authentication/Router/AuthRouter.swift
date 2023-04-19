//
//  AuthRouter.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Aung Ko Ko on 04/04/2023.
//

import Foundation

class AuthRouter {
    static func createModule() -> LoginViewController {
        let vc = LoginViewController()
        let interactor = AuthInteractor()
        let dataManager = AuthManager()
        let presenter = AuthPresenter()
        vc.interactor = interactor
        interactor.dataManager = dataManager
        dataManager.presenter = presenter
        presenter.view = vc
        return vc
    }
}
