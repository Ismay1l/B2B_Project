//
//  SignUpView+Extension.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import Foundation
import UIKit

extension SignUpView: UITextFieldDelegate,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = vm.categories[indexPath.row]
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryDropDownButton.setTitle("\(vm.categories[indexPath.row])", for: .normal)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        if !(nameLastnameTextField.text?.isEmpty ?? false) {
//
//            nameLastnameTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
//            nameLastnameTextField.rightView = correctTickIcon
//            nameLastnameTextField.rightViewMode = .always
//            wrongNameLastnameAlertLabel.isHidden = true
//        } else {
//
//            nameLastnameTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
//            nameLastnameTextField.rightView = nil
//            wrongNameLastnameAlertLabel.isHidden = false
//        }
        
//        if isValidEmail(emailTextField.text ?? "NA") {
//
//            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
//            emailTextField.rightView = correctTickIcon
//            emailTextField.rightViewMode = .always
//            wrongEmailAlertLabel.isHidden = true
//        } else {
//
//            emailTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
//            emailTextField.rightView = nil
//            wrongEmailAlertLabel.isHidden = false
//        }
//
//        if !(companyNameTextField.text?.isEmpty ?? false) {
//
//            companyNameTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
//            companyNameTextField.rightView = correctTickIcon
//            companyNameTextField.rightViewMode = .always
//            wrongCompanyNameAlertLabel.isHidden = true
//        } else {
//
//            companyNameTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
//            companyNameTextField.rightView = nil
//            wrongCompanyNameAlertLabel.isHidden = false
//        }
//
//        if !(telephoneTextField.text?.isEmpty ?? false) {
//
//            telephoneTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
//            telephoneTextField.rightView = correctTickIcon
//            telephoneTextField.rightViewMode = .always
//            wrongTelephoneAlertLabel.isHidden = true
//        }else {
//
//            telephoneTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
//            telephoneTextField.rightView = nil
//            wrongTelephoneAlertLabel.isHidden = false
//        }
        
        if emailTextField.text != "", nameLastnameTextField.text != "", companyNameTextField.text != "", telephoneTextField.text != "", isValidEmail(emailTextField.text ?? "NA") {







            telephoneTextField.layer.borderColor = hexStringToUIColor(hex: "#00D68F").cgColor
            telephoneTextField.rightView = correctTickIcon
            telephoneTextField.rightViewMode = .always

            nextButton.isEnabled = true
            nextButton.layer.opacity = 1
        } else {




            companyNameTextField.layer.borderColor = hexStringToUIColor(hex: "#FF3D71").cgColor
            companyNameTextField.rightView = nil



            nextButton.isEnabled = false
            nextButton.layer.opacity = 0.5
        }
    }
}
