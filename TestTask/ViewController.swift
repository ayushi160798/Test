//
//  ViewController.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    let loginManager = FirebaseAuthManager()
    let viewModel = HeadLineViewModel()
    var headLineInfoList: HeadLineResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   

    @IBAction func btnSigInAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController" ) as! SignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLogInAction(_ sender: UIButton) {
        guard let email = txtEmail.text, let password = txtPassword.text else { return }
        loginManager.logIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                self.viewModel.getHeadLineData { (data, err) in
                    print(data)
                    if err == nil, let listData = data {
                        self.headLineInfoList = listData
                        DispatchQueue.main.async {
                            let headLineVC = self.storyboard?.instantiateViewController(withIdentifier: "HeadLineViewController" ) as! HeadLineViewController
                            headLineVC.userInfoList = listData
                            self.navigationController?.pushViewController(headLineVC, animated: true)
                        }
                        
                    }
                    else{
                        print(err?.localizedDescription)
                    }
                }
            }
//            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertController, animated: true)
        }
    }
    
}

