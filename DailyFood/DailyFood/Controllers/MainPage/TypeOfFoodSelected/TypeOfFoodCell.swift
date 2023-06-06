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
    
    var typeFoodCellLabel = UILabel()
    
    var image = ""
        
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = backgroundColorOfIconItem
        layer.cornerRadius = 10
        layer.masksToBounds = true

        
        setup()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Default two functions Setup and Layout 
    func setup(){
        
        namefOfFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        namefOfFoodLabel.text = "Сарделька в тИсти"
        namefOfFoodLabel.numberOfLines = 0
        namefOfFoodLabel.adjustsFontSizeToFitWidth = true
        namefOfFoodLabel.sizeToFit()
        namefOfFoodLabel.textAlignment = .center

        
        priceOfFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        priceOfFoodLabel.text = "20 ₴"
        priceOfFoodLabel.numberOfLines = 0
        priceOfFoodLabel.adjustsFontSizeToFitWidth = true
        priceOfFoodLabel.sizeToFit()
        priceOfFoodLabel.textAlignment = .center
        
        imageOfFoodImage.translatesAutoresizingMaskIntoConstraints = false
        imageOfFoodImage.image = UIImage(named: "hotdog")
        
        
        addItemToBasket.translatesAutoresizingMaskIntoConstraints = false
        addItemToBasket.setTitle("В корзину", for: .normal)
        addItemToBasket.setTitleColor(.white, for: .normal)
        addItemToBasket.backgroundColor = .orange
        addItemToBasket.clipsToBounds = true
        addItemToBasket.layer.cornerRadius = 8
        addItemToBasket.addTarget(self, action: #selector(addToBasket(action:)), for: .touchUpInside)
        

    }
    
    
    @objc func addToBasket(action: UIButton) {
        
        if action == action {
            var model = ModelFood()
            model.nameFood = namefOfFoodLabel.text ?? "NoNameInModel"
            model.imageFood = image
            model.priceOfFood = priceOfFoodLabel.text ?? "NoPriceInModel"
            
            GlobalManagerArray.shared.addDataInArray(data: model)
            
            addItemToBasket.setTitle("В корзині", for: .normal)
            addItemToBasket.backgroundColor = .systemOrange
            addItemToBasket.setTitleColor(.white, for: .normal)
                        
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
            namefOfFoodLabel.widthAnchor.constraint(equalToConstant: 80),
            namefOfFoodLabel.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
        
        NSLayoutConstraint.activate([
            
            priceOfFoodLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            priceOfFoodLabel.trailingAnchor.constraint(equalTo: namefOfFoodLabel.leadingAnchor),
            priceOfFoodLabel.widthAnchor.constraint(equalToConstant: 40),
            priceOfFoodLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        NSLayoutConstraint.activate([
            imageOfFoodImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfFoodImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            addItemToBasket.centerXAnchor.constraint(equalTo: namefOfFoodLabel.trailingAnchor),
            addItemToBasket.centerYAnchor.constraint(equalTo: priceOfFoodLabel.centerYAnchor),
            addItemToBasket.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        
        
    }
    //MARK: - Getting data from model
    func configureCollectionCell(model: ModelFood){
        
        priceOfFoodLabel.text = "\(model.priceOfFood ?? "NoPrice") ₴"
        image = model.imageFood!
        imageOfFoodImage.image = UIImage(named: model.imageFood!)
        namefOfFoodLabel.text = model.nameFood
        typeFoodCellLabel.text = model.typeFood?.rawValue
        
    }
}
