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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        nameOfType.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout(){
        addSubview(nameOfType)
        
        NSLayoutConstraint.activate([
            nameOfType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            nameOfType.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfType.heightAnchor.constraint(equalToConstant: 25),
            nameOfType.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureCell(model: String){
        nameOfType.text = model
        
    }
}
