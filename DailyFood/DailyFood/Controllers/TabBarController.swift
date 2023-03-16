//
//  ViewController.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

enum Tabs: Int {
    case account
    case main
}

class TabBarController: UITabBarController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTabBar()

    }
    
    func settingsTabBar(){
        
        tabBar.backgroundColor = .lightGray
        
        let mainController = MainViewController()
        let accountController = AccountViewController()
        
        let mainNavigation = UINavigationController(rootViewController: mainController)
        let accountNavigation = UINavigationController(rootViewController: accountController)
        
        mainNavigation.tabBarItem = UITabBarItem(title: "Main",
                                                 image: Resources.Images.main,
                                                 tag: Tabs.main.rawValue)
        
        accountNavigation.tabBarItem = UITabBarItem(title: "Account",
                                                    image: Resources.Images.account,
                                                    tag: Tabs.account.rawValue)
        
        setViewControllers([mainNavigation, accountNavigation], animated: false)
                
    }
}

