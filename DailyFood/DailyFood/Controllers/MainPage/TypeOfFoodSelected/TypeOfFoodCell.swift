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
    
    var imageString = ""
    
    var temporaryValueIDOfFood: Int = 0
        
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
        namefOfFoodLabel.font = UIFont.boldSystemFont(ofSize: 17)
        namefOfFoodLabel.textAlignment = .center
        namefOfFoodLabel.textColor = .black

        
        priceOfFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        priceOfFoodLabel.text = "20 ₴"
        priceOfFoodLabel.numberOfLines = 0
        priceOfFoodLabel.adjustsFontSizeToFitWidth = true
        priceOfFoodLabel.sizeToFit()
        priceOfFoodLabel.textAlignment = .center
        priceOfFoodLabel.textColor = .black

        
        imageOfFoodImage.translatesAutoresizingMaskIntoConstraints = false
        imageOfFoodImage.image = UIImage(named: "hotdog")
        imageOfFoodImage.layer.cornerRadius = 10
        
        
        
        addItemToBasket.translatesAutoresizingMaskIntoConstraints = false
        addItemToBasket.setTitle("В корзину", for: .normal)
        addItemToBasket.setTitleColor(.white, for: .normal)
        addItemToBasket.backgroundColor = .orange
        addItemToBasket.clipsToBounds = true
        addItemToBasket.layer.cornerRadius = 10
        addItemToBasket.addTarget(self, action: #selector(addToBasket(action:)), for: .touchUpInside)
        

    }

    
    func layout() {
        addSubview(imageOfFoodImage)
        addSubview(addItemToBasket)
        addSubview(priceOfFoodLabel)
        addSubview(namefOfFoodLabel)

        
        NSLayoutConstraint.activate([
            imageOfFoodImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfFoodImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfFoodImage.heightAnchor.constraint(equalToConstant: bounds.width / 4.5),
            imageOfFoodImage.widthAnchor.constraint(equalToConstant: bounds.width / 4.5)
        ])
        
        NSLayoutConstraint.activate([
            namefOfFoodLabel.leadingAnchor.constraint(equalTo: imageOfFoodImage.trailingAnchor),
            namefOfFoodLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            namefOfFoodLabel.topAnchor.constraint(equalTo: imageOfFoodImage.topAnchor),
            namefOfFoodLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        NSLayoutConstraint.activate([
            
            priceOfFoodLabel.bottomAnchor.constraint(equalTo: imageOfFoodImage.bottomAnchor),
            priceOfFoodLabel.trailingAnchor.constraint(equalTo: namefOfFoodLabel.centerXAnchor),
            priceOfFoodLabel.heightAnchor.constraint(equalToConstant: 25),
            priceOfFoodLabel.widthAnchor.constraint(equalToConstant: bounds.width / 3)

        ])
        
        NSLayoutConstraint.activate([
            
            addItemToBasket.leadingAnchor.constraint(equalTo: namefOfFoodLabel.centerXAnchor),
            addItemToBasket.centerYAnchor.constraint(equalTo: priceOfFoodLabel.centerYAnchor),
            addItemToBasket.heightAnchor.constraint(equalToConstant: 25),
            addItemToBasket.widthAnchor.constraint(equalToConstant: bounds.width / 3)
            
        ])
        
        
        
        
        
    }
    //MARK: - Objc targer for button
    
    @objc func addToBasket(action: UIButton) {
        
        var model = SpecificTypeOfFoodElement()
        model.name = namefOfFoodLabel.text ?? "NoNameInModel"
        model.image = imageString
        let priceWithOutSymbol = priceOfFoodLabel.text
        if let unwrappedPrice = priceWithOutSymbol?.dropLast(2), let intValue = Int(unwrappedPrice){
            model.price = intValue
            
        }
        model.id = temporaryValueIDOfFood
        GlobalManagerArray.shared.addDataInArray(data: model)
        
        addItemToBasket.setTitle("В корзині", for: .normal)
        addItemToBasket.backgroundColor = .systemOrange
        addItemToBasket.setTitleColor(.white, for: .normal)
        
    }
    
    //MARK: - Getting data from model
    func configureCollectionCell(model: SpecificTypeOfFoodElement){
        
        imageString = model.image ?? "notValue in configureCell"
        
        temporaryValueIDOfFood = model.id ?? 111
        
        if let imageData = Data(base64Encoded: model.image ?? "hotdog"){
            if let image = UIImage(data: imageData){
                imageOfFoodImage.image = image
                
            }
        }
        priceOfFoodLabel.text = "\(Int(model.price ?? 000)) ₴"
        namefOfFoodLabel.text = model.name ?? "noValueinConfigureSell"
    }
}
