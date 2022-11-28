//
//  LoginRouter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 26.11.2022.
//

import Foundation

class LoginRouter: PresenterToRouterLoginProtocol {
    
    static func createModule(ref: LoginViewController) {
        
        let presenter = LoginPresenter()
        //View
        ref.loginPresenterObject = presenter
        //Presenter
        ref.loginPresenterObject?.loginInteractor = LoginInteractor()
        ref.loginPresenterObject?.loginView = ref
        //Interactor
        ref.loginPresenterObject?.loginInteractor?.loginPresenter = presenter
    }
}
