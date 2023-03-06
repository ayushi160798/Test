//
//  FireBaseManger.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import Foundation
import FirebaseAuth
import UIKit

class FirebaseAuthManager {
    func signIn(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    func logIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let err = error as? NSError {
                completionBlock(false)
            }
            else {
                completionBlock(true)
            }
            //        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            //            if let error = error, let _ = AuthErrorCode(AuthErrorCode.Code(rawValue: error._code) ?? AuthErrorCode.Code) {
            //                completionBlock(false)
            //            } else {
            //                completionBlock(true)
            //            }
            //        }
            // }
        }
    }
    
}
