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
    
    var dataManager = DataManager()
    
    var infoAboutAllOrders: AllOrdersOfUser = []
    
    var allSpecificAboutOrderPriceImage: SpecificOrder = []
    
    var allId = [Int]()
    
    var concretycaliyFood: SpecificTypeOfFood = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Мої закази"
        
        view.backgroundColor = backgroundOfAllApps
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
        
        
        setup()
        layout()
        gettingDataAboutAllOrdersOfUser()
        changeValueInArrayFromApi()
        
        
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
    
    //MARK: - NetworkAndGettingData
    
    func gettingDataAboutAllOrdersOfUser(){
        self.dataManager.fetchInfoOrdersOfUser {
            DispatchQueue.main.async {
                self.infoAboutAllOrders = self.dataManager.infoAboutOrders
                self.ordersCollectionView?.reloadData()
                
            }
            
            self.dataManager.fetchTypeOfFoodAndAllSpecificFood {
                if self.dataManager.sortedArrayOfSpecificFoodOfID.count > 0{
                    self.changeValueInArrayFromApi()
                }
            }
            
        }
        
    }
    func changeValueInArrayFromApi() {
        self.concretycaliyFood = self.dataManager.sortedArrayOfSpecificFoodOfID
        DispatchQueue.main.async {
            self.ordersCollectionView?.reloadData()

        }
        print(self.concretycaliyFood.count)

    }

}




//MARK: - Extensions

extension OrdersPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoAboutAllOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ordersCollectionView?.dequeueReusableCell(withReuseIdentifier: OrdersPageCollectionViewCell.reuseID, for: indexPath) as? OrdersPageCollectionViewCell
        
        cell?.locationOrder.addTarget(self, action: #selector(location(action:)), for: .touchUpInside)
        if concretycaliyFood.count > 0 {
            cell!.configureCollectionViewCell2(model: infoAboutAllOrders[indexPath.row], priceAndImage: concretycaliyFood[indexPath.row])
        }else{
            cell!.configureCollectionViewCell1(model: infoAboutAllOrders[indexPath.row])
        }
        
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

