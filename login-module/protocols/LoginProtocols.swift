//
//  LoginProtocols.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 26.11.2022.
//

import Foundation

protocol ViewToPresenterLoginProtocol {
    var loginInteractor: PresenterToInteractorLoginProtocol? {get set}
    var loginView: PresenterToViewLoginProtocol? {get set}
    
    func loginUser(email: String, password: String)
}

protocol PresenterToInteractorLoginProtocol {
    var loginPresenter: InteractorToPresenterLoginProtocol? {get set}
    
    func login(email: String, password: String)
}

protocol PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginViewController)
}

//Taşıyıcı Protocoller
protocol PresenterToViewLoginProtocol {
    func sendDataToView(result: Bool)
}

protocol InteractorToPresenterLoginProtocol {
    func sendDataToPresenter(result: Bool)
}
