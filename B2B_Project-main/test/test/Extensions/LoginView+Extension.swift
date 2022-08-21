//
//  LoginViewEXT.swift
//  test
//
//  Created by USER11 on 8/18/22.
//

import Foundation
import UIKit

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if isValidEmail( emailTextField.text ?? "NA") {
            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
            emailTextField.rightView = correctTickIcon
            emailTextField.rightViewMode = .always
            wrongEmailAlertLabel.removeFromSuperview()
            
            enterButton.isEnabled = true
            enterButton.layer.opacity = 1
            
            passwordLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(emailTextField.snp.bottom).offset(23)
            }
            
            passwordTextField.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.right.equalToSuperview().offset(-25)
                make.top.equalTo(passwordLabel.snp.bottom).offset(12)
                make.height.equalTo(50)
            }
            
            rememberMeBox.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(passwordTextField.snp.bottom).offset(14)
                make.height.width.equalTo(20)
            }
            
            forgotPasswordButton.snp.makeConstraints { make in
                make.centerY.equalTo(rememberMeBox.snp.centerY)
                make.right.equalToSuperview().offset(-25)
            }
            
            rememberMeButton.snp.makeConstraints { make in
                make.centerY.equalTo(rememberMeBox.snp.centerY)
                make.left.equalTo(rememberMeBox.snp.right).offset(10)
            }
            
            enterButton.snp.makeConstraints { make in
                make.top.equalTo(rememberMeButton.snp.bottom).offset(48)
                make.left.equalToSuperview().offset(25)
                make.right.equalToSuperview().offset(-25)
                make.height.equalTo(49)
            }
        } else {
            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
            emailTextField.rightView = nil
            addSubview(wrongEmailAlertLabel)
            
            enterButton.isEnabled = false
            enterButton.layer.opacity = 0.5
            
            passwordLabel.removeFromSuperview()
            passwordTextField.removeFromSuperview()
            rememberMeBox.removeFromSuperview()
            rememberMeButton.removeFromSuperview()
            forgotPasswordButton.removeFromSuperview()
            enterButton.removeFromSuperview()
            
            wrongEmailAlertLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(emailTextField.snp.bottom).offset(12)
            }
            
            addSubview(passwordLabel)
            addSubview(passwordTextField)
            addSubview(rememberMeBox)
            addSubview(rememberMeButton)
            addSubview(forgotPasswordButton)
            addSubview(enterButton)
            
            passwordLabel.snp.makeConstraints { make in
                make.top.equalTo(wrongEmailAlertLabel.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(25)
            }
            
            passwordTextField.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.right.equalToSuperview().offset(-25)
                make.top.equalTo(passwordLabel.snp.bottom).offset(12)
                make.height.equalTo(50)
            }
            
            rememberMeBox.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(25)
                make.top.equalTo(passwordTextField.snp.bottom).offset(14)
                make.height.width.equalTo(20)
            }
            
            forgotPasswordButton.snp.makeConstraints { make in
                make.centerY.equalTo(rememberMeBox.snp.centerY)
                make.right.equalToSuperview().offset(-25)
            }
            
            rememberMeButton.snp.makeConstraints { make in
                make.centerY.equalTo(rememberMeBox.snp.centerY)
                make.left.equalTo(rememberMeBox.snp.right).offset(10)
            }
            
            enterButton.snp.makeConstraints { make in
                make.top.equalTo(rememberMeButton.snp.bottom).offset(48)
                make.left.equalToSuperview().offset(25)
                make.right.equalToSuperview().offset(-25)
                make.height.equalTo(49)
            }
        }
    }
}
