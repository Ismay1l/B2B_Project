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
        
        if passwordTextField.text?.count ?? 0 >= 6 {
            wrongPasswordAlertLabel.isHidden = true
            passwordTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
        } else {
            wrongPasswordAlertLabel.isHidden = false
            passwordTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
        }
        
        if isValidEmail( emailTextField.text ?? "NA") {
            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
            emailTextField.rightView = correctTickIcon
            emailTextField.rightViewMode = .always
            
            enterButton.isEnabled = true
            enterButton.layer.opacity = 1
            
            wrongEmailAlertLabel.isHidden = true
        } else {
            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
            emailTextField.rightView = nil
            
            enterButton.isEnabled = false
            enterButton.layer.opacity = 0.5
            
            emailStackView.addArrangedSubview(wrongEmailAlertLabel)
            wrongEmailAlertLabel.isHidden = false
        }
    }
}
