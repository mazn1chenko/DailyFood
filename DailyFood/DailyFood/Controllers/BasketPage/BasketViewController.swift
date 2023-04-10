//
//  BasketViewController.swift
//  DailyFood
//
//  Created by m223 on 19.03.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    let labelWithButtonBuy = UILabel()
    
    let buyButton = UIButton()
    
    let sumOfItem = 0
    
    let sumOfItemPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Корзина"
        
        view.backgroundColor = .lightGray
        
        setup()
        layout()
        settingsNavBar()

        
    }
    
    func setup() {
        
        labelWithButtonBuy.translatesAutoresizingMaskIntoConstraints = false
        labelWithButtonBuy.text = "\(sumOfItem) товар на суму = \(sumOfItemPrice)₴"
        
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.setTitle("Оформити", for: .normal)
        buyButton.backgroundColor = .orange
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 4
        buyButton.setTitleColor(.white, for: .normal)
        
        buyButton.addTarget(self, action: #selector(buyItems(action:)), for: .touchUpInside)
        
        
    }
    
    @objc func buyItems(action: UIButton) {
        
        if action == action {
            print("buyItems")
        }
    }
    
    func layout() {
        view.addSubview(labelWithButtonBuy)
        view.addSubview(buyButton)
        
        NSLayoutConstraint.activate([
            labelWithButtonBuy.heightAnchor.constraint(equalToConstant: 44),
            labelWithButtonBuy.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            labelWithButtonBuy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelWithButtonBuy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 7)
            
        ])
        
        NSLayoutConstraint.activate([
            buyButton.centerYAnchor.constraint(equalTo: labelWithButtonBuy.centerYAnchor),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            buyButton.heightAnchor.constraint(equalToConstant: 20),
            buyButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    func settingsNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .lightGray
    }
    
}
