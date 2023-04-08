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
    case basket
}

class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTabBar()

    }
    
    func settingsTabBar(){
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = .lightGray
        tabBar.backgroundColor = .lightGray
        tabBar.layer.borderWidth = 0.2
        self.navigationItem.setHidesBackButton(true, animated: false)

        
        let mainController = MainViewController()
        let accountController = AccountViewController()
        let basketController = BasketViewController()
        
        let mainNavigation = UINavigationController(rootViewController: mainController)
        let accountNavigation = UINavigationController(rootViewController: accountController)
        let basketNavigation = UINavigationController(rootViewController: basketController)
        
        
        mainNavigation.tabBarItem = UITabBarItem(title: "DailyFood",
                                                 image: Resources.Images.main,
                                                 tag: Tabs.main.rawValue)
        
        accountNavigation.tabBarItem = UITabBarItem(title: "Аккаунт",
                                                    image: Resources.Images.account,
                                                    tag: Tabs.account.rawValue)
        
        basketNavigation.tabBarItem = UITabBarItem(title: "Корзина",
                                                    image: Resources.Images.basket,
                                                    tag: Tabs.basket.rawValue)
        
        
        setViewControllers([mainNavigation, basketNavigation, accountNavigation], animated: false)
                
    }
}

