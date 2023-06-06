//
//  BasketCollectionViewCell.swift
//  DailyFood
//
//  Created by m223 on 11.04.2023.
//

import UIKit

class BasketCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "BasketCustomCollectionViewCell"
    
    weak var delegate: (any CollectionViewCellDelegate)?
    
    var imageOfOrdersImage = UIImageView()
    
    let nameItem = UILabel()
    
    let deleteItemFromBasket = UIButton(type: .system)
    
    let priceItem = UILabel()
    
    let sumOfOrdersCount = 128
    
    let numberOfOrdersCount = 12
    
    let statusOfCurrentOrders = UILabel()
    
    var image = ""
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Default two function Setup and Layout

    
    func setup() {
        
        imageOfOrdersImage.translatesAutoresizingMaskIntoConstraints = false
        imageOfOrdersImage.backgroundColor = backgroundColorOfIconItem
        
        priceItem.translatesAutoresizingMaskIntoConstraints = false
        priceItem.text = "Сума \(sumOfOrdersCount) ₴"
        priceItem.textColor = .black
        priceItem.font = UIFont(name: "American Typewriter", size: 16)

        
        
        nameItem.translatesAutoresizingMaskIntoConstraints = false
        nameItem.text = "№ \(numberOfOrdersCount)"
        nameItem.textColor = .black
        nameItem.font = UIFont(name: "American Typewriter", size: 16)
                      
        deleteItemFromBasket.translatesAutoresizingMaskIntoConstraints = false
        deleteItemFromBasket.setTitleColor(.black, for: .normal)
        deleteItemFromBasket.setTitle("X", for: .normal)
        deleteItemFromBasket.backgroundColor = .white
        deleteItemFromBasket.contentHorizontalAlignment = .right
        deleteItemFromBasket.addTarget(self, action: #selector(removeFromBasket(action:)), for: .touchUpInside)

        
        statusOfCurrentOrders.translatesAutoresizingMaskIntoConstraints = false
        statusOfCurrentOrders.text = "Знижка 5% "
        statusOfCurrentOrders.textColor = .systemGreen
        statusOfCurrentOrders.font = UIFont(name: "American Typewriter", size: 16)
        statusOfCurrentOrders.textAlignment = .right


        
    }
    
    func layout() {
        addSubview(imageOfOrdersImage)
        addSubview(nameItem)
        addSubview(priceItem)
        addSubview(deleteItemFromBasket)
        addSubview(statusOfCurrentOrders)
        
        NSLayoutConstraint.activate([
            
            imageOfOrdersImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfOrdersImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            imageOfOrdersImage.heightAnchor.constraint(equalToConstant: bounds.height / 2.5),
            imageOfOrdersImage.widthAnchor.constraint(equalToConstant: bounds.height / 2.5)

        ])
        
        NSLayoutConstraint.activate([
            nameItem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            nameItem.bottomAnchor.constraint(equalTo: imageOfOrdersImage.topAnchor, constant: -10),
            nameItem.heightAnchor.constraint(equalToConstant: 30),
            nameItem.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            deleteItemFromBasket.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            deleteItemFromBasket.bottomAnchor.constraint(equalTo: imageOfOrdersImage.topAnchor, constant: -10),
            deleteItemFromBasket.heightAnchor.constraint(equalToConstant: 30),
            deleteItemFromBasket.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            priceItem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            priceItem.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5),
            priceItem.heightAnchor.constraint(equalToConstant: 30),
            priceItem.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            
            statusOfCurrentOrders.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            statusOfCurrentOrders.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5),
            statusOfCurrentOrders.heightAnchor.constraint(equalToConstant: 30),
            statusOfCurrentOrders.widthAnchor.constraint(equalToConstant: 200)
            
        ])
        
    }
    
    @objc func removeFromBasket(action: UIButton){
        if action == action {
            var model = ModelFood()
            model.nameFood = nameItem.text ?? "NoNameInModel"
            model.imageFood = image
            model.priceOfFood = priceItem.text ?? "NoPriceInModel"
            GlobalManagerArray.shared.removeItem(removeItem: model)
            delegate?.reloadData() // running method "reloadData" in Delegate
        }
    }
    
    func configureCollectionViewCell(model: ModelFood){
        imageOfOrdersImage.image = UIImage(named: model.imageFood!)
        image = model.imageFood!
        priceItem.text = model.priceOfFood
        nameItem.text = model.nameFood
        
    }
    
    
    
}
