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
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if error != nil{
                    //TODO: - application flow can be improved, rathen than using your result parameter find a way to use API's return values
                    strongSelf.loginPresenter?.sendDataToPresenter(result: false)
                } else {
                    strongSelf.loginPresenter?.sendDataToPresenter(result: true)
                }
            }
        }else{
            self.loginPresenter?.sendDataToPresenter(result: false)
        }
    }
    
    
}
