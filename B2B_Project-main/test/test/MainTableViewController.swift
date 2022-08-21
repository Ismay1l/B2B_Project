//
//  MainTableViewController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit

class MainTableViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = CustomColors.tabBarTintColor
        tabBar.barStyle = .default
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .black
        
        let homeNC = HomeNavigationController()
        homeNC.tabBarItem.title = "Home"
        homeNC.tabBarItem.image = UIImage(systemName: "")
        
        let searchNC = SearchNavigationController()
        searchNC.tabBarItem.title = "Search"
        searchNC.tabBarItem.image = UIImage(named: "alarm_grey")
        
        let addTenderNC = AddTenderNavigationController()
        addTenderNC.tabBarItem.title = "Add Tender"
        addTenderNC.tabBarItem.image = UIImage(named: "stopwatch_black")
        
        let statisticsNC = StatisticsNavigationController()
        statisticsNC.tabBarItem.title = "Statistics"
        statisticsNC.tabBarItem.image = UIImage(named: "timer_black")
        
        let accountNC = AccountNavigationController()
        accountNC.tabBarItem.title = "Account"
        accountNC.tabBarItem.image = UIImage(named: "timer_black")
        
        self.viewControllers = [homeNC, searchNC, addTenderNC, accountNC]
        
        self.selectedIndex = 0
    }
}
