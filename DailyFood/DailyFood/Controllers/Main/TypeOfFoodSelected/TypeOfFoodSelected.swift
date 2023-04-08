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
    
    
    var menuFoodModel: [ModelFood] = {
        var hotdog = ModelFood()
        hotdog.nameFood = "Хот-дог"
        hotdog.priceOfFood = "24"
        hotdog.imageFood = "hotdog"
        
         var borsh = ModelFood()
        borsh.nameFood = "Борщ"
        borsh.priceOfFood = "21"
        borsh.imageFood = "borsh"
        
         var pancake = ModelFood()
        pancake.nameFood = "Панкейки"
        pancake.priceOfFood = "30"
        pancake.imageFood = "pancake"
        
        
        return [hotdog, pancake, borsh]
        
    }()
    
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
        return menuFoodModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfFoodCell.reuseID, for: indexPath) as? TypeOfFoodCell
        
        cell!.configureCollectionCell(model: menuFoodModel[indexPath.row])
        return cell!
    }
    
}
