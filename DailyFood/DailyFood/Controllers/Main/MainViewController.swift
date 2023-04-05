//
//  Main.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

class MainViewController: UIViewController{
    
    let searchBar = UISearchController()
        
    private var collectionView: UICollectionView?
    
    let layoutFLow = UICollectionViewFlowLayout()

    
    
    //private let identifier = "MyCell"
    
    let menuFood = ["Перші блюда","Гарніри","Салати","Холодні закуски","Напої","Десерти","Сніданки","Дитяче","Від Шефа","Унікальне :)",]
    let menuFoodImage = ["firstPNG", "garnirPNG", "saladPNG", "snackPNG", "coctailsPNG", "dessertPNG", "breakfastPNG", "babyPNG", "cheffPNG", "lolPNG"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "DailyFood"
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        navigationItem.searchController = searchBar
        
        setup()
        layout()
        buttonsNavBar()

        
    }
    
    func setup() {
              
        layoutFLow.scrollDirection = .vertical
        layoutFLow.minimumLineSpacing = 1
        layoutFLow.minimumInteritemSpacing = 1
        layoutFLow.itemSize = CGSize(width: (view.frame.size.width / 2) - 4,
                                 height: (view.frame.size.width / 2) - 4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFLow)

        guard let collectionView = collectionView else {return}
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseID)

        
    }
    
    func layout() {
        view.addSubview(collectionView!)

        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    
    
    func buttonsNavBar() {
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Button", style: .done, target: self, action: #selector(buttonMenu(action:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "basket"), style: .done, target: self, action: #selector(buttonMenu(action:)))
        
    }
    @objc func buttonMenu(action: UIButton){
        if action == action {
            let basketVC = BasketViewController()
            navigationController?.pushViewController(basketVC, animated: true)
        }
    }

}



extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseID, for: indexPath) as? MenuCollectionViewCell
        
        cell!.configureCollectionCell(model: menuFood[indexPath.row], image: menuFoodImage[indexPath.row])
        return cell!
        
    }
    
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TypeOfFoodSelected()
        vc.navigationItem.title = menuFood[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
