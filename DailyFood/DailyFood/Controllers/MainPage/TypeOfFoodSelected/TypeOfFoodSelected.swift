//
//  TypeOfFoodSelected.swift
//  DailyFood
//
//  Created by m223 on 21.03.2023.
//

import UIKit

class TypeOfFoodSelected: UIViewController {
    
    
    private var collectionView: UICollectionView?
    
    let layoutFLow = UICollectionViewFlowLayout()
    
    var sortedArray: SpecificTypeOfFood = []
            
    var allFoodArray: SpecificTypeOfFood = []
    
    var typeOfFood: TypeOfFoodAPI = []
    
    let dataManager = DataManager()
    
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundOfAllApps
        
        network()
        setup()
        layout()
        settingsNavBar()

 
    }

    
    //MARK: - Default two function Setup and Layout

    func setup() {
        
        layoutFLow.scrollDirection = .vertical
        layoutFLow.minimumLineSpacing = 6
        layoutFLow.minimumInteritemSpacing = 4
        
        layoutFLow.itemSize = CGSize(width: (view.frame.size.width) - 5, height: view.frame.size.width / 4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFLow)
        
        guard let collectionView = collectionView else {return}
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = backgroundOfAllApps
        collectionView.register(TypeOfFoodCell.self, forCellWithReuseIdentifier: TypeOfFoodCell.reuseID)
        
        
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
    
    //MARK: - NetworkAndGettingData

    func network() {
        dataManager.fetchTypeOfFoodAndAllSpecificFood {
            DispatchQueue.main.async {
                self.allFoodArray = self.dataManager.specificFood
                self.typeOfFood = self.dataManager.typeOfFood
                self.funcSortedArray()
                self.collectionView?.reloadData()
            }
        }
    }
    
    func settingsNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .lightGray
    }
    
    func funcSortedArray() {
        for i in allFoodArray{
            if i.categoryID == selectedIndex{
                sortedArray.append(i)
            }
        }
        collectionView?.reloadData()
    }

}
    //MARK: - Extensions
extension TypeOfFoodSelected: UICollectionViewDelegate{
    
}



extension TypeOfFoodSelected: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfFoodCell.reuseID, for: indexPath) as? TypeOfFoodCell
        cell!.configureCollectionCell(model: sortedArray[indexPath.row])
        print(cell)
        return cell!
    }
    
}
