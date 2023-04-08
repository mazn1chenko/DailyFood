//
//  NavBarController.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       settingsNavBar()
        
        
    }
    
    func settingsNavBar()  {
        
        navigationController?.navigationBar.isTranslucent = false
        navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.backgroundColor = .lightGray
        
        
        
    }

    
}
