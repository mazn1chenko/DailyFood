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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        contentView.backgroundColor = .systemYellow
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setup(){
        nameOfTypeFood.translatesAutoresizingMaskIntoConstraints = false
        nameOfTypeFood.textAlignment = .center
        
    }
    func layout(){
        addSubview(nameOfTypeFood)
        
        NSLayoutConstraint.activate([
            nameOfTypeFood.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameOfTypeFood.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfTypeFood.heightAnchor.constraint(equalToConstant: 100),
            nameOfTypeFood.widthAnchor.constraint(equalToConstant: frame.width)
        ])
        
    }
    
    func configureCollectionCell(model: String){
        nameOfTypeFood.text = model
    }
    
}

