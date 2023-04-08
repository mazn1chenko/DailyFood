//
//  TypeOfFoodCell.swift
//  DailyFood
//
//  Created by m223 on 21.03.2023.
//

import UIKit

class TypeOfFoodCell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    
    let namefOfFoodLabel = UILabel()
    
    let priceOfFoodLabel = UILabel()
    
    let imageOfFoodImage = UIImageView()
    
    let addItemToBasket = UIButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .blue
        layer.cornerRadius = 10
        layer.masksToBounds = true

        
        setup()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        namefOfFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        namefOfFoodLabel.text = "Сарделька в тИсти"
        namefOfFoodLabel.textAlignment = .center

        
        priceOfFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        priceOfFoodLabel.text = "20 ₴"
        priceOfFoodLabel.textAlignment = .center
        
        imageOfFoodImage.translatesAutoresizingMaskIntoConstraints = false
        imageOfFoodImage.image = UIImage(named: "hotdog")
        
        
        addItemToBasket.translatesAutoresizingMaskIntoConstraints = false
        addItemToBasket.setTitle("Купити", for: .normal)
        addItemToBasket.setTitleColor(.white, for: .normal)
        addItemToBasket.backgroundColor = .red
        addItemToBasket.addTarget(self, action: #selector(addToBasket(action:)), for: .touchUpInside)

    }
    
    
    @objc func addToBasket(action: UIButton) {
        
        if action == action {
            print("item added to basket")
        }
    }

    
    func layout() {
        addSubview(namefOfFoodLabel)
        addSubview(priceOfFoodLabel)
        addSubview(imageOfFoodImage)
        addSubview(addItemToBasket)
        
        
        NSLayoutConstraint.activate([
            namefOfFoodLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            namefOfFoodLabel.topAnchor.constraint(equalTo: topAnchor),
            namefOfFoodLabel.widthAnchor.constraint(equalToConstant: 250),
            namefOfFoodLabel.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
        
        NSLayoutConstraint.activate([
            
            priceOfFoodLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceOfFoodLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceOfFoodLabel.widthAnchor.constraint(equalToConstant: 250),
            priceOfFoodLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            imageOfFoodImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfFoodImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            addItemToBasket.trailingAnchor.constraint(equalTo: trailingAnchor),
            addItemToBasket.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
        
    }
    
    func configureCollectionCell(model: ModelFood){
        priceOfFoodLabel.text = model.priceOfFood
        imageOfFoodImage.image = UIImage(named: model.imageFood!)
        namefOfFoodLabel.text = model.nameFood
        
    }
}
