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
    
    let menuFood = ["Перші блюда","Гарніри","#ЛюблюВаню","Салати","Холодні закуски","Напої","Десерти","Сніданки","Дитяче","Від Шефа","Унікальне :)",]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "DailyFood"
        
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
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseID)
        collectionView.frame = view.bounds
        view.addSubview(collectionView)

        
    }
    
    func layout() {

        
    }

 
    func buttonsNavBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Knopka Blyat", style: .done, target: self, action: #selector(buttonMenu(action:)))
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
        
        cell!.configureCollectionCell(model: menuFood[indexPath.row])
        return cell!
    }
    
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
    
    
}
