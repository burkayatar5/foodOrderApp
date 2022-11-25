//
//  SignUpPresenter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.09.2022.
//

import Foundation

class SignUpPresenter: ViewToPresenterSignUpProtocol {
    var signUpInteractor: PresenterToInteractorSignUpProtocol?
    var signUpView: PresenterToViewSignUpProtocol?
    
    func registerUser(email: String, password: String) {
        signUpInteractor?.register(email: email, password: password)
    }
}
extension SignUpPresenter: InteractorToPresenterSignUpProtocol {
    func sendDataToPresenter(result: Bool) {
        signUpView?.sendDataToView(result: result)
    }
}
