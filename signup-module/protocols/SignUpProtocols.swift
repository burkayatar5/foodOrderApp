//
//  SignUpProtocols.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.09.2022.
//

import Foundation
//TODO: Where to put register controls?
protocol ViewToPresenterSignUpProtocol {
    var signUpInteractor: PresenterToInteractorSignUpProtocol? {get set}
    var signUpView: PresenterToViewSignUpProtocol? {get set}
    
    func registerUser(email: String, password: String)
}

protocol PresenterToInteractorSignUpProtocol {
    var signUpPresenter: InteractorToPresenterSignUpProtocol? {get set}
    
    func register(email: String, password: String)
}

protocol PresenterToRouterSignUpProtocol {
    static func createModule(ref: SignUpViewController)
}

//Taşıyıcı Protocoller
protocol PresenterToViewSignUpProtocol {
    func sendDataToView(result: Bool)
}

protocol InteractorToPresenterSignUpProtocol {
    func sendDataToPresenter(result: Bool)
}


