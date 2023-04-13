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
    
    var sortedArray = [ModelFood]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
        settingsNavBar()
        funcSortedArray()
        
        
    }
    
    
    var menuFoodModel: [ModelFood] = {
        var hotdog = ModelFood()
        hotdog.nameFood = "Хот-дог"
        hotdog.typeFood = .snack
        hotdog.priceOfFood = "24"
        hotdog.imageFood = "hotdog"
        
        var borsh = ModelFood()
        borsh.nameFood = "Борщ"
        borsh.typeFood = .first
        borsh.priceOfFood = "21"
        borsh.imageFood = "borsh"
        
        var pancake = ModelFood()
        pancake.nameFood = "Панкейки"
        pancake.typeFood = .desert
        pancake.priceOfFood = "30"
        pancake.imageFood = "pancake"
        
        var soup = ModelFood()
        soup.nameFood = "Суп"
        soup.typeFood = .first
        soup.priceOfFood = "19"
        soup.imageFood = "soup"
        
        var chicken = ModelFood()
        chicken.nameFood = "Курка"
        chicken.typeFood = .meats
        chicken.priceOfFood = "27"
        chicken.imageFood = "chicken"
        
        var pig = ModelFood()
        pig.nameFood = "Свинина"
        pig.typeFood = .meats
        pig.priceOfFood = "36"
        pig.imageFood = "pig"
        
        var potato = ModelFood()
        potato.nameFood = "Картопля"
        potato.typeFood = .garnir
        potato.priceOfFood = "20"
        potato.imageFood = "potato"
        
        var rice = ModelFood()
        rice.nameFood = "Рис"
        rice.typeFood = .garnir
        rice.priceOfFood = "20"
        rice.imageFood = "rice"
        
        var fish = ModelFood()
        fish.nameFood = "Риба"
        fish.typeFood = .meats
        fish.priceOfFood = "28"
        fish.imageFood = "fish"
        
        var coffee = ModelFood()
        coffee.nameFood = "Кофе"
        coffee.typeFood = .coctails
        coffee.priceOfFood = "16"
        coffee.imageFood = "coffee"
        
        var tea = ModelFood()
        tea.nameFood = "Чай"
        tea.typeFood = .coctails
        tea.priceOfFood = "12"
        tea.imageFood = "tea"
        
        var juice = ModelFood()
        juice.nameFood = "Сок"
        juice.typeFood = .coctails
        juice.priceOfFood = "20"
        juice.imageFood = "juice"
        
        var cheesecake = ModelFood()
        cheesecake.nameFood = "Чизкейк"
        cheesecake.typeFood = .desert
        cheesecake.priceOfFood = "15"
        cheesecake.imageFood = "cheesecake"
        
        var cezar = ModelFood()
        cezar.nameFood = "Цезар"
        cezar.typeFood = .salad
        cezar.priceOfFood = "18"
        cezar.imageFood = "cezar"
        
        var summer = ModelFood()
        summer.nameFood = "Літній"
        summer.typeFood = .salad
        summer.priceOfFood = "12"
        summer.imageFood = "summer"
        
        
        return [hotdog, pancake, borsh, soup, chicken, coffee, tea, cheesecake, summer, cezar, pig, fish, juice, rice, potato]
        
    }()
    

    
    func setup() {
        
        layoutFLow.scrollDirection = .vertical
        layoutFLow.minimumLineSpacing = 6
        layoutFLow.minimumInteritemSpacing = 4
        layoutFLow.itemSize = CGSize(width: (view.frame.size.width / 2) - 8,
                                     height: (view.frame.size.width / 2) - 8)
        
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
    
    func settingsNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .lightGray
    }
    
    func funcSortedArray(){
        for i in menuFoodModel{
            if i.typeFood?.rawValue == navigationItem.title{
                sortedArray.append(i)
            }
        }
        print(sortedArray.count)
    }

}

extension TypeOfFoodSelected: UICollectionViewDelegate{
    
}



extension TypeOfFoodSelected: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfFoodCell.reuseID, for: indexPath) as? TypeOfFoodCell
        cell!.configureCollectionCell(model: sortedArray[indexPath.row])
        return cell!
    }
    
}
