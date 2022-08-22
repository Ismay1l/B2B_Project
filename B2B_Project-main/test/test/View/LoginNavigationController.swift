//
//  LoginNavigationController.swift
//  test
//
//  Created by Ismayil Ismayilov on 22.08.22.
//

import UIKit

class LoginNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let loginVC = LoginViewController()
        self.viewControllers = [loginVC]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
}
