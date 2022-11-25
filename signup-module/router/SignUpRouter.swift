//
//  SignUpRouter.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.09.2022.
//

import Foundation

class SignUpRouter: PresenterToRouterSignUpProtocol {
    
    static func createModule(ref: SignUpViewController) {
        
        let presenter = SignUpPresenter()
        //View
        ref.signUpPresenterObject = presenter
        //Presenter
        ref.signUpPresenterObject?.signUpInteractor = SignUpInteractor()
        ref.signUpPresenterObject?.signUpView = ref
        //Interactor
        ref.signUpPresenterObject?.signUpInteractor?.signUpPresenter = presenter
    }
}
