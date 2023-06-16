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
        namefOfFoodLabel.sizeToFit()
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
        
        
        
        addItemToBasket.translatesAutoresizingMaskIntoConstraints = false
        addItemToBasket.setTitle("В корзину", for: .normal)
        addItemToBasket.setTitleColor(.white, for: .normal)
        addItemToBasket.backgroundColor = .orange
        addItemToBasket.clipsToBounds = true
        addItemToBasket.layer.cornerRadius = 8
        addItemToBasket.addTarget(self, action: #selector(addToBasket(action:)), for: .touchUpInside)
        

    }

    
    func layout() {
        addSubview(imageOfFoodImage)
        addSubview(addItemToBasket)
        addSubview(priceOfFoodLabel)
        addSubview(namefOfFoodLabel)

        
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
            imageOfFoodImage.topAnchor.constraint(equalTo: topAnchor, constant: -1),
            imageOfFoodImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 1),
            imageOfFoodImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            imageOfFoodImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1)
        ])
        
        NSLayoutConstraint.activate([
            
            addItemToBasket.centerXAnchor.constraint(equalTo: namefOfFoodLabel.trailingAnchor),
            addItemToBasket.centerYAnchor.constraint(equalTo: priceOfFoodLabel.centerYAnchor),
            addItemToBasket.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        
        
    }
    //MARK: - Objc targer for button
    
    @objc func addToBasket(action: UIButton) {
        
        var model = SpecificTypeOfFoodElement()
        model.name = namefOfFoodLabel.text ?? "NoNameInModel"
        model.image = imageString
        if let unwrappedPrice = priceOfFoodLabel.text, let intValue = Int(unwrappedPrice){
            model.price = intValue
            
        }
        model.id = temporaryValueIDOfFood
        print("\(model.id)")
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
        priceOfFoodLabel.text = "\(Int(model.price ?? 000))"
        namefOfFoodLabel.text = model.name ?? "noValueinConfigureSell"
    }
}
