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
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
        segmentController.selectedSegmentioIndex = 0
    }
    
    func didTapSignUp() {
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
        segmentController.selectedSegmentioIndex = 1
    }
    
    func didTapNext() {
        navigationController?.pushViewController(successView, animated: true)
    }
    
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapEnter() {
        let vc = CustomTabBarController()
        vc.tabBar.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
}
