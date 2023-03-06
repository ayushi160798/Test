//
//  SignInViewController.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    let signUpManager = FirebaseAuthManager()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func btnSignIn(sender: UIButton){
        if let email = self.txtEmail.text, let password = self.txtPassword.text {
               signUpManager.signIn(email: email, password: password) {[weak self] (success) in
                   guard let `self` = self else { return }
                   var message: String = ""
                   if (success) {
                       message = "User was sucessfully created."
                   } else {
                       message = "There was an error."
                   }
                   let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                   self.present(alertController, animated: true)
               }
           }
    }

}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  func isValidPassword(_ password: String) -> Bool {
    let minPasswordLength = 6
    return password.count >= minPasswordLength
  }
