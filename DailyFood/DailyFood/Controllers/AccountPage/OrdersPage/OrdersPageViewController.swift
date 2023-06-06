//
//  OrdersPageViewController.swift
//  DailyFood
//
//  Created by m223 on 29.03.2023.
//

import UIKit

class OrdersPageViewController: UIViewController {
    
    private var ordersCollectionView : UICollectionView?
    
    let layoutFlow = UICollectionViewFlowLayout()

    let countOfOrders = ["hotdog", "hotdog"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мої закази"

        view.backgroundColor = backgroundOfAllApps
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
            navigationController?.navigationBar.tintColor = .black
        
        
        setup()
        layout()
        
    }
    //MARK: - Default two function Setup and Layout
    
    func setup() {
        
        
        layoutFlow.scrollDirection = .vertical
        layoutFlow.minimumLineSpacing = 1
        layoutFlow.minimumInteritemSpacing = 1
        layoutFlow.itemSize = CGSize(width: view.frame.size.width,
                                     height: view.frame.size.height / 5.25)
        
        ordersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        
        guard let ordersCollectionView = ordersCollectionView else {return}
        
        
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.backgroundColor = backgroundOfAllApps
        ordersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ordersCollectionView.register(OrdersPageCollectionViewCell.self, forCellWithReuseIdentifier: OrdersPageCollectionViewCell.reuseID)
        
        
    }
    
    func layout() {
        view.addSubview(ordersCollectionView!)
        
        NSLayoutConstraint.activate([
            ordersCollectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ordersCollectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ordersCollectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ordersCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}


//MARK: - Extensions

extension OrdersPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countOfOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ordersCollectionView?.dequeueReusableCell(withReuseIdentifier: OrdersPageCollectionViewCell.reuseID, for: indexPath) as? OrdersPageCollectionViewCell
        
        cell?.locationOrder.addTarget(self, action: #selector(location(action:)), for: .touchUpInside)
        
        cell!.configureCollectionViewCell(image: countOfOrders[indexPath.row])
        
        return cell!
    }
    
    @objc func location(action: UIButton ){
        
        if action == action {
            
            navigationController?.pushViewController(LocationPageViewController(), animated: true)
        }
    }
    
    
    
}

extension OrdersPageViewController: UICollectionViewDelegate {
    
}

