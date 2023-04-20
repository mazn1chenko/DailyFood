//
//  Main.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

class MainViewController: UIViewController{
    
    let searchBarController = UISearchController()
            
    private var collectionView: UICollectionView?
    
    let layoutFLow = UICollectionViewFlowLayout()


    
    //private let identifier = "MyCell"
    
    let menuFood = ["Перші блюда","Гарніри","Салати","Холодні закуски","Напої","Десерти","Сніданки","Дитяче","Від Шефа","Мʼясне",]
    let menuFoodImage = ["firstPNG", "garnirPNG", "saladPNG", "snackPNG", "coctailsPNG", "dessertPNG", "breakfastPNG", "babyPNG", "cheffPNG", "meatsPNG"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "DailyFood"
        
        view.backgroundColor = backgroundOfAllApps
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        setup()
        layout()
        //searchBurSettings()
        
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        navigationItem.backBarButtonItem?.tintColor = .gray
        //navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = backgroundOfAllApps
        

        
    }
    
    func setup() {
              
        layoutFLow.scrollDirection = .vertical
        layoutFLow.minimumLineSpacing = 1
        layoutFLow.minimumInteritemSpacing = 1
        layoutFLow.itemSize = CGSize(width: (view.frame.size.width / 2) - 8,
                                 height: (view.frame.size.width / 2) - 8)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFLow)

        guard let collectionView = collectionView else {return}
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = backgroundOfAllApps
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseID)

        
    }
    
    func layout() {
        view.addSubview(collectionView!)

        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
        
    }
    
    
    
    func searchBurSettings() {
        
        
        navigationItem.searchController = searchBarController
        
        let searchBur = UISearchBar()
        navigationController?.navigationItem.titleView = searchBur
        

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
