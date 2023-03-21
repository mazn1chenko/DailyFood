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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        setup()
        layout()
        settingsNavBar()
        
        
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
        collectionView.register(TypeOfFoodCell.self, forCellWithReuseIdentifier: TypeOfFoodCell.reuseID)
        
        
    }
    
    func layout() {
        view.addSubview(collectionView!)

        collectionView!.frame = view.bounds

        
    }
    
    func settingsNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "basket"), style: .done, target: self, action: #selector(buttonMenu(action:)))
        
    }
    @objc func buttonMenu(action: UIButton){
        if action == action {
            let basketVC = BasketViewController()
            navigationController?.pushViewController(basketVC, animated: true)
        }
    }
    
    
}

extension TypeOfFoodSelected: UICollectionViewDelegate{
    
}

extension TypeOfFoodSelected: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfFoodCell.reuseID, for: indexPath)
        return cell
    }
    
}
