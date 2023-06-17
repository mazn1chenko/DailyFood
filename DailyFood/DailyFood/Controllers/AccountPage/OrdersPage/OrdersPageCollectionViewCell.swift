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
    
    var numberOfOrdersLabel = UILabel()
    
    let dateOrdersLabel = UILabel()
    
    let sumOfCurrentOrdersLabel = UILabel()
    
    let sumOfOrdersCount = 128
    
    let numberOfOrdersCount = 12
    
    let statusOfCurrentOrders = UILabel()
    
    let locationOrder = UIButton()
    
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
        
        sumOfCurrentOrdersLabel.translatesAutoresizingMaskIntoConstraints = false
        sumOfCurrentOrdersLabel.text = "Сума \(sumOfOrdersCount) ₴"
        sumOfCurrentOrdersLabel.textColor = .black
        sumOfCurrentOrdersLabel.font = UIFont(name: "American Typewriter", size: 16)
        
        
        
        numberOfOrdersLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfOrdersLabel.text = "№ \(numberOfOrdersCount)"
        numberOfOrdersLabel.textColor = .black
        numberOfOrdersLabel.font = UIFont(name: "American Typewriter", size: 16)
        
        dateOrdersLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOrdersLabel.text = "5 квітня 2023"
        dateOrdersLabel.textAlignment = .right
        dateOrdersLabel.textColor = .black
        dateOrdersLabel.font = UIFont(name: "American Typewriter", size: 16)
        dateOrdersLabel.textColor = .gray
        
        statusOfCurrentOrders.translatesAutoresizingMaskIntoConstraints = false
        statusOfCurrentOrders.text = "Очікуйте прибуття курʼєру"
        statusOfCurrentOrders.textColor = .systemGreen
        statusOfCurrentOrders.font = UIFont(name: "American Typewriter", size: 16)
        statusOfCurrentOrders.textAlignment = .right
        
        locationOrder.translatesAutoresizingMaskIntoConstraints = false
        locationOrder.setTitle("Відстежити замовлення", for: .normal)
        locationOrder.tintColor = .white
        locationOrder.backgroundColor = .orange
        locationOrder.titleLabel?.font = UIFont(name: "American Typewriter", size: 14)
        locationOrder.titleLabel?.textAlignment = .right
        locationOrder.layer.cornerRadius = 10
        locationOrder.sizeToFit()
        
        
        
    }
    
    func layout() {
        addSubview(imageOfOrdersImage)
        addSubview(numberOfOrdersLabel)
        addSubview(sumOfCurrentOrdersLabel)
        addSubview(dateOrdersLabel)
        addSubview(statusOfCurrentOrders)
        addSubview(locationOrder)
        
        NSLayoutConstraint.activate([
            
            imageOfOrdersImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfOrdersImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            imageOfOrdersImage.heightAnchor.constraint(equalToConstant: bounds.height / 2.5),
            imageOfOrdersImage.widthAnchor.constraint(equalToConstant: bounds.height / 2.5)
            
        ])
        
        NSLayoutConstraint.activate([
            numberOfOrdersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            numberOfOrdersLabel.bottomAnchor.constraint(equalTo: imageOfOrdersImage.topAnchor, constant: -10),
            numberOfOrdersLabel.heightAnchor.constraint(equalToConstant: 30),
            numberOfOrdersLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            dateOrdersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateOrdersLabel.bottomAnchor.constraint(equalTo: imageOfOrdersImage.topAnchor, constant: -10),
            dateOrdersLabel.heightAnchor.constraint(equalToConstant: 30),
            dateOrdersLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            sumOfCurrentOrdersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.5),
            sumOfCurrentOrdersLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5),
            sumOfCurrentOrdersLabel.heightAnchor.constraint(equalToConstant: 30),
            sumOfCurrentOrdersLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            
            statusOfCurrentOrders.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            statusOfCurrentOrders.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5),
            statusOfCurrentOrders.heightAnchor.constraint(equalToConstant: 30),
            statusOfCurrentOrders.widthAnchor.constraint(equalToConstant: 200)
            
        ])
        NSLayoutConstraint.activate([
            
            locationOrder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            locationOrder.bottomAnchor.constraint(equalTo: statusOfCurrentOrders.topAnchor),
            locationOrder.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    
    //MARK: - ConfiguratinFunctionOfCell
    
    func configureCollectionViewCell(model: AllOrdersOfUserElement){
        
        numberOfOrdersLabel.text = "№ \(model.id ?? 000)"
        sumOfCurrentOrdersLabel.text = "Ваня кде цена заказа"
        dateOrdersLabel.text = {
            var readyDate = ""
            var dateString = model.startTime
            var dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            if let date = dateFormater.date(from: dateString ?? "NoDate"){
                readyDate = "\(date)"
            }else{
                readyDate = "NoDate"
            }
            return String(readyDate.dropLast(6))
        }()
        statusOfCurrentOrders.text = {
            var text = ""
            if model.status == false{
                text = "В обробці"
            }else{
                text = "Завершений"
            }
            return text
        }()
    }
    
    
}
