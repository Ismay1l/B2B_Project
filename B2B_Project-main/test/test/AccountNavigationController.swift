//
//  AccountNavigationController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class AccountNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountVC = AccountVC()
        self.viewControllers = [accountVC]
        
        self.navigationItem.leftBarButtonItem = nil
        interactivePopGestureRecognizer?.isEnabled = false
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        accountVC.navigationItem.title = "Account"
    }
}
