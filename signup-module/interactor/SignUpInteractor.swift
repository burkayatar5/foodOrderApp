//
//  SignUpInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.09.2022.
//

import Foundation
import Firebase

class SignUpInteractor: PresenterToInteractorSignUpProtocol {
    var signUpPresenter: InteractorToPresenterSignUpProtocol?
    
    func register(email: String, password: String) {
        //TODO: Add necessary firebase code
        if email != "" && password != "" {
                Auth.auth().createUser(withEmail: email, password: password) { dataResult, error in
                    if error != nil {
                        self.signUpPresenter?.sendDataToPresenter(result: false)
                        print(error?.localizedDescription)
                    }else {
                        self.signUpPresenter?.sendDataToPresenter(result: true)
                    }
                }
        }else {
            self.signUpPresenter?.sendDataToPresenter(result: false)
        }
    }
}
