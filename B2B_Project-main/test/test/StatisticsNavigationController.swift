//
//  StatisticsNavigationController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class StatisticsNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statisticsVC = StatisticsVC()
        self.viewControllers = [statisticsVC]
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        
        navigationBar.prefersLargeTitles = true
        statisticsVC.navigationItem.title = "Statistics"
    }
}
