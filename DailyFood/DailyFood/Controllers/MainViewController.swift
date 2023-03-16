//
//  Main.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

class MainViewController: UIViewController{
    
    let searchBar = UISearchController()
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Головна"
        
        navigationItem.searchController = searchBar
        
        settingsSearchBar()
        buttonsNavBar()
        
    }
    
    func settingsSearchBar() {
        searchBar.searchBar.placeholder = "Пошук продуктiв"
    }
    
    func buttonsNavBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(buttonMenu(action:)))
        
    }
    @objc func buttonMenu(action: UIButton){
        if action == action {
            print("menu button working")
        }
    }
}
