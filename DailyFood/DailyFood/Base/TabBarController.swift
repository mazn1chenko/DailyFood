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

class TabBarController: UITabBarController, UITabBarControllerDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTabBar()
        
        self.tabBarController?.delegate = self

    }

    
    func settingsTabBar(){
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = backgroundOfAllApps
        tabBar.backgroundColor = backgroundOfAllApps
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .orange
        tabBar.selectedItem?.badgeColor = .orange
        tabBar.layer.borderWidth = 0.2
        self.navigationItem.setHidesBackButton(true, animated: false)
        let attributes = [NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 14)]

        
        let mainController = MainViewController()
        let accountController = AccountViewController()
        let basketController = BasketViewController()
        
        let mainNavigation = UINavigationController(rootViewController: mainController)
        let accountNavigation = UINavigationController(rootViewController: accountController)
        let basketNavigation = UINavigationController(rootViewController: basketController)
        
        
        mainNavigation.tabBarItem = UITabBarItem(title: "DailyFood",
                                                 image: Resources.Images.main,
                                                 tag: Tabs.main.rawValue)
        
        mainNavigation.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        
        accountNavigation.tabBarItem = UITabBarItem(title: "Аккаунт",
                                                    image: Resources.Images.account,
                                                    tag: Tabs.account.rawValue)
        
        accountNavigation.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        basketNavigation.tabBarItem = UITabBarItem(title: "Корзина",
                                                    image: Resources.Images.basket,
                                                    tag: Tabs.basket.rawValue)
        
        basketNavigation.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        setViewControllers([mainNavigation, basketNavigation, accountNavigation], animated: false)
                
    }

}

