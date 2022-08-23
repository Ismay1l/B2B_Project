//
//  HomeNavigationController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class HomeNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeVC()
        self.viewControllers = [homeVC]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        homeVC.navigationItem.title = "Home"
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
