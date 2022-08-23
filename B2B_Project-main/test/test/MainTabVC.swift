//
//  MainTabViewController.swift
//  test
//
//  Created by USER11 on 8/23/22.
//

import UIKit
import RAMAnimatedTabBarController

class MainTabVC: UIViewController {
    
    let mainTabVC = MainTabViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .link
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
    }
}
