//
//  RegisterViewController.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 19.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
                        //email
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorViewLabel: UILabel!
    
    var loginPresenterObject: ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorView.isHidden = true
        LoginRouter.createModule(ref: self)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let validation = validateInputs()
        if validation != true {
            errorView.isHidden = false
            ViewAnimationsSingelton.sharedInstance.shakingAnimation(for: errorView)
        } else {
            guard let email = firstNameTextField.text, let password = passwordTextField.text else {
                errorViewLabel.text = "Please fill all fields."
                errorView.isHidden = false
                return
            }
            loginPresenterObject?.loginUser(email: email, password: password)
        }
    }
    
    func validateInputs() -> Bool? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorViewLabel.text = "Please fill all the fields."
            return false
        }
        return true
    }

}
extension LoginViewController: PresenterToViewLoginProtocol {
    func sendDataToView(result: Bool) {
        if result {
            //TODO: -Refactor for repeated code
            let alertController = UIAlertController(title: "Success", message: "User logged in successfully", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel) { handler in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let root = storyboard.instantiateViewController(withIdentifier: "tabBarController")
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.keyWindow?.rootViewController = root
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }else {
            let alertController = UIAlertController(title: "Error", message: "Login failed! pls check your info and try again.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
    }
}
