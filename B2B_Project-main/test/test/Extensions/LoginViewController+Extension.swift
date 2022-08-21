//
//  LoginViewController+Extension.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import Foundation

extension LoginViewController: LoginViewDelegate,
                               SignUpViewDelegate,
                               SuccessViewDelegate{
    
    func didTapLogin() {
        switchToLoginView()
    }
    
    func didTapSignUp() {
        switchToSignUpView()
    }
    
    func didTapNext() {
        switchToSuccessView()
    }
    
    func didTapBackButton() {
        switchToMainPage()
    }
}
