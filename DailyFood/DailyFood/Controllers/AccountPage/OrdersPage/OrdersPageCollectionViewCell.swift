//
//  OrdersPageCollectionViewCell.swift
//  DailyFood
//
//  Created by m223 on 05.04.2023.
//

import UIKit

class OrdersPageCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "OrdersCustomCollectionViewCell"
    
    let imageOfOrdersImage = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        imageOfOrdersImage.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func layout() {
        addSubview(imageOfOrdersImage)
        
        NSLayoutConstraint.activate([
            imageOfOrdersImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfOrdersImage.topAnchor.constraint(equalTo: topAnchor),
            imageOfOrdersImage.heightAnchor.constraint(equalToConstant: 60),
            imageOfOrdersImage.widthAnchor.constraint(equalToConstant: frame.width)
        ])
        
    }
    
    func configureCollectionViewCell(image: String){
        
        imageOfOrdersImage.image = UIImage(named: image)
        
    }
    
    
}
