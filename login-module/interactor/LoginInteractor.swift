//
//  LoginInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 26.11.2022.
//

import Foundation
import Firebase

class LoginInteractor: PresenterToInteractorLoginProtocol {
    
    var loginPresenter: InteractorToPresenterLoginProtocol?
    
    func login(email: String, password: String) {
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email, password: password) { dataResult, error in
                if error != nil{
                    self.loginPresenter?.sendDataToPresenter(result: false)
                } else {
                    self.loginPresenter?.sendDataToPresenter(result: true)
                }
            }
        }else{
            self.loginPresenter?.sendDataToPresenter(result: false)
        }
    }
    
    
}
