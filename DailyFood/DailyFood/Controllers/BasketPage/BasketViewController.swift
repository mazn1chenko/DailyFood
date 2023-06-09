//
//  BasketViewController.swift
//  DailyFood
//
//  Created by m223 on 19.03.2023.
//

import UIKit

class BasketViewController: UIViewController, UITabBarControllerDelegate, CollectionViewCellDelegate {
    
    
    var labelWithButtonBuy = UILabel()
    
    let buyButton = UIButton()
            
    var addedItem: SpecificTypeOfFood = []
    
    var sumOfItemPrice = 0
    
    private var basketCollectionView : UICollectionView?
    
    let layoutFlow = UICollectionViewFlowLayout()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Корзина"
        
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
        settingsNavBar()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.tabBarController?.delegate = self
        
        
    }
    
    
    //function for updating CollectionView after click on this view on TabBar
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            addedItem = GlobalManagerArray.shared.getArray()
            basketCollectionView?.reloadData()
            let sumAndCount = GlobalManagerArray.shared.getSumOfItemPriceAndCount()
            labelWithButtonBuy.text = "\(sumAndCount.1) товари на суму  \(sumAndCount.0)₴"
        }
    }
    
    //MARK: - Default two function Setup and Layout

    func setup() {
        
        labelWithButtonBuy.translatesAutoresizingMaskIntoConstraints = false
        labelWithButtonBuy.text = "0 товарів на суму 0 ₴"
        labelWithButtonBuy.textColor = .gray
        
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.setTitle("Оформити", for: .normal)
        buyButton.backgroundColor = .orange
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 4
        buyButton.setTitleColor(.white, for: .normal)
        
        buyButton.addTarget(self, action: #selector(buyItems(action:)), for: .touchUpInside)
        
        
        layoutFlow.scrollDirection = .vertical
        layoutFlow.minimumLineSpacing = 1
        layoutFlow.minimumInteritemSpacing = 1
        layoutFlow.itemSize = CGSize(width: view.frame.size.width,
                                     height: view.frame.size.height / 5)
        
        basketCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        
        guard let basketCollectionView = basketCollectionView else {return}
        
        basketCollectionView.dataSource = self
        basketCollectionView.delegate = self
        basketCollectionView.backgroundColor = backgroundOfAllApps
        basketCollectionView.translatesAutoresizingMaskIntoConstraints = false
        basketCollectionView.register(BasketCollectionViewCell.self, forCellWithReuseIdentifier: BasketCollectionViewCell.reuseID)
        
        
    }

    func layout() {
        view.addSubview(labelWithButtonBuy)
        view.addSubview(buyButton)
        view.addSubview(basketCollectionView!)
        
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
            
        NSLayoutConstraint.activate([
            basketCollectionView!.topAnchor.constraint(equalTo: labelWithButtonBuy.bottomAnchor),
            basketCollectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            basketCollectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            basketCollectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    //MARK: - Objc targer for button

    
    @objc func buyItems(action: UIButton) {
        
        if action == action {
            let dialogeMessage = UIAlertController(title: "Увага!", message: "Кнопка ще в розробці", preferredStyle: .alert)
            let buttonOK = UIAlertAction(title: "Добре!", style: .default)
            dialogeMessage.addAction(buttonOK)
            self.present(dialogeMessage, animated: true)
            

        }
    }
    
    //MARK: - Some functions
    
    func settingsNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .lightGray

    }
    
    //Methods which update data in basket
    func updateBasketView(in cell: BasketViewController) {
        basketCollectionView?.reloadData()
    }
    
    func reloadData() {
        addedItem = GlobalManagerArray.shared.getArray()
        basketCollectionView?.reloadData()
        let sumAndCount = GlobalManagerArray.shared.getSumOfItemPriceAndCount()
        labelWithButtonBuy.text = "\(sumAndCount.1) товарів на суму \(sumAndCount.0)₴"
    }

}


    //MARK: - Extensions
extension BasketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addedItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = basketCollectionView?.dequeueReusableCell(withReuseIdentifier: BasketCollectionViewCell.reuseID, for: indexPath) as? BasketCollectionViewCell
        
        cell!.configureCollectionViewCell(model: addedItem[indexPath.row])
        
        cell?.delegate = self
            
        return cell!
    }
    
    
    
}

extension BasketViewController: UICollectionViewDelegate {
    
}

protocol CollectionViewCellDelegate: BasketViewController{
    
    func updateBasketView(in cell: Self)
    
}
