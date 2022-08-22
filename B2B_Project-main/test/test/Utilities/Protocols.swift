//
//  Protocols.swift
//  test
//
//  Created by Ismayil Ismayilov on 20.08.22.
//

import Foundation

protocol LoginViewDelegate {
    func didTapSignUp()
    func didTapEnter()
}

protocol SignUpViewDelegate {
    func didTapLogin()
    func didTapNext()
}

protocol SuccessViewDelegate {
    func didTapBackButton()
}
