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
        
    }
    
    func setup() {
        
        labelWithButtonBuy.translatesAutoresizingMaskIntoConstraints = false
        labelWithButtonBuy.text = "\(sumOfItem) товар на суму = \(sumOfItemPrice)₴"
        
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.setTitle("Оформити", for: .normal)
        buyButton.backgroundColor = .red
        buyButton.setTitleColor(.white, for: .normal)
        
        
    }
    
    func layout() {
        view.addSubview(labelWithButtonBuy)
        view.addSubview(buyButton)
        
        NSLayoutConstraint.activate([
            labelWithButtonBuy.heightAnchor.constraint(equalToConstant: 44),
            labelWithButtonBuy.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            labelWithButtonBuy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelWithButtonBuy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            buyButton.centerYAnchor.constraint(equalTo: labelWithButtonBuy.centerYAnchor),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 20),
            buyButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
