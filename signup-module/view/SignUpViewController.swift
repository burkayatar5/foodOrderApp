//
//  SignUpViewController.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 19.09.2022.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorViewLabel: UILabel!
    
    var signUpPresenterObject: ViewToPresenterSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorView.isHidden = true
        SignUpRouter.createModule(ref: self)
    }
    
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let validation = validateInputs()
    
        if validation != true {
            errorView.isHidden = false
            ViewAnimationsSingelton.sharedInstance.shakingAnimation(for: errorView)
        } else {
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                errorViewLabel.text = "Please fill all fields."
                errorView.isHidden = false
                return
            }
            signUpPresenterObject?.registerUser(email: email, password: password)
            
        }
    }
    
    func validateInputs() -> Bool? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorViewLabel.text = "Please fill all the fields."
            return false
        }
        //force unwrapping because if statement above make us sure that it is not null
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanedPassword) == false {
            errorViewLabel.text = "6 digit password required."
            return false
        }
        return true
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        //one big letter one digit at least 4 characters
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9]).{6,}$")
        return passwordTest.evaluate(with: password)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SignUpViewController: PresenterToViewSignUpProtocol {
    func sendDataToView(result: Bool) {
        if result {
            let alertController = UIAlertController(title: "Success", message: "User created successfully", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel) { handler in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "WelcomePageController")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }else {
            let alertController = UIAlertController(title: "Error", message: "Something Went Wrong, Try again.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
    }
}
