//
//  SignUpView+Extension.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import Foundation
import UIKit

extension SignUpView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if emailTextField.text != "", nameLastnameTextField.text != "", companyNameTextField.text != "", telephoneTextField.text != "" {
            nextButton.isEnabled = true
            nextButton.layer.opacity = 1
        }
    }
}
