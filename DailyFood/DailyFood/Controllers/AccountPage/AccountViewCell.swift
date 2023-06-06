//
//  AccountViewCell.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit

class AccountViewCell: UITableViewCell {

    static let reuseID = "AccountTableCell"
    
    let nameOfType = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setup()
        layout()
        selectedBackgroundView?.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Default two function Setup and Layout
    
    func setup(){
        nameOfType.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout(){
        addSubview(nameOfType)
        
        NSLayoutConstraint.activate([
            nameOfType.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            nameOfType.heightAnchor.constraint(equalToConstant: 65),
            nameOfType.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureCell(model: String){
        nameOfType.text = model
        
    }
}
