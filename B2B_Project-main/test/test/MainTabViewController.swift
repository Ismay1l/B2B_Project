//
//  MainTableViewController.swift
//  test
//
//  Created by Ismayil Ismayilov on 21.08.22.
//

import UIKit
import RAMAnimatedTabBarController

class MainTabViewController: UITabBarController {

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

class CustomTabBarController: RAMAnimatedTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    private func configure() {
        
        let homeNC = HomeNavigationController()
        
        let searchNC = SearchNavigationController()
        
        let addTenderNC = AddTenderNavigationController()
        
        let statisticsNC = StatisticsNavigationController()
        
        let accountNC = AccountNavigationController()
        
        homeNC.tabBarItem = RAMAnimatedTabBarItem(title: "Home",
                                                  image: UIImage(named: "ic_home"),
                                                  tag: 1)
        
        searchNC.tabBarItem = RAMAnimatedTabBarItem(title: "Search",
                                                  image: UIImage(named: "ic_search"),
                                                  tag: 2)
        
        addTenderNC.tabBarItem = RAMAnimatedTabBarItem(title: "",
                                                  image: UIImage(named: "ic_add"),
                                                  tag: 3)
        
        statisticsNC.tabBarItem = RAMAnimatedTabBarItem(title: "Statistics",
                                                  image: UIImage(named: "ic_statistics"),
                                                  tag: 4)
        
        accountNC.tabBarItem = RAMAnimatedTabBarItem(title: "Account",
                                                  image: UIImage(named: "ic_account"),
                                                  tag: 5)
        
        (homeNC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (searchNC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (addTenderNC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (statisticsNC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (accountNC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        
        setViewControllers([homeNC, searchNC, addTenderNC, statisticsNC, accountNC], animated: true)
    }
}
