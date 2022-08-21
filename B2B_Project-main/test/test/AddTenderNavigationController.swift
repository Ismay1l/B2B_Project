//
//  AddTenderNavigationController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class AddTenderNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addTenderVC = AddTenderVC()
        self.viewControllers = [addTenderVC]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        addTenderVC.navigationItem.title = "Add Tender"
    }
}
