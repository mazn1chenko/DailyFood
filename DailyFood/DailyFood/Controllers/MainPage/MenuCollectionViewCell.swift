//
//  MenuCollectionViewCell.swift
//  DailyFood
//
//  Created by m223 on 19.03.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CustomCollectionViewCell"
    
    let nameOfTypeFood = UILabel()
    
    let backGroungImageCell = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        contentView.backgroundColor = backgroundColorOfIconItem
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Default two function Setup and Layout

    func setup(){
        nameOfTypeFood.translatesAutoresizingMaskIntoConstraints = false
        nameOfTypeFood.textAlignment = .center
        nameOfTypeFood.textColor = .orange
        nameOfTypeFood.font = UIFont.boldSystemFont(ofSize: 18)
        
        backGroungImageCell.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func layout(){
        addSubview(backGroungImageCell)
        addSubview(nameOfTypeFood)

        
        NSLayoutConstraint.activate([
            nameOfTypeFood.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameOfTypeFood.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfTypeFood.heightAnchor.constraint(equalToConstant: 60),
            nameOfTypeFood.widthAnchor.constraint(equalToConstant: frame.width)
        ])
        
        NSLayoutConstraint.activate([
            backGroungImageCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGroungImageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        ])
        
        
        
    }
    //MARK: - method getting data from model
    func configureCollectionCell(model: TypeOfFoodAPIElement){
        nameOfTypeFood.text = model.name
    }
    
}
