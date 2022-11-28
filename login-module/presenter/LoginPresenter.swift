//
//  LoginPresenter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 26.11.2022.
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {
    
    var loginInteractor: PresenterToInteractorLoginProtocol?
    var loginView: PresenterToViewLoginProtocol?
    
    func loginUser(email: String, password: String) {
        loginInteractor?.login(email: email, password: password)
    }
}
extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func sendDataToPresenter(result: Bool) {
        loginView?.sendDataToView(result: result)
    }
}
