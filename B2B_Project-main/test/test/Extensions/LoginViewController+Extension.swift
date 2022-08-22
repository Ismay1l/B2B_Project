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
        segmentController.selectedSegmentioIndex = 0
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
    }
    
    func didTapSignUp() {
        segmentController.selectedSegmentioIndex = 1
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
    }
    
    func didTapNext() {
//        switchToSuccessView()
    }
    
    func didTapBackButton() {
//        switchToMainPage()
    }
}
