//
//  DeliveryPageViewController.swift
//  DailyFood
//
//  Created by m223 on 29.03.2023.
//

import UIKit

class DeliveryPageViewController: UIViewController {
    
    var streetTextField = UITextField()
    var houseStreetTextField = UITextField()
    var roomTextField = UITextField()
    var saveDataButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Адреса доставки"
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
        
    }
    
    func setup() {
        let cornerRadius: CGFloat = 16

        streetTextField.translatesAutoresizingMaskIntoConstraints = false
        streetTextField.placeholder = "Ваша вулиця"
        streetTextField.backgroundColor = backgroundColorOfIconItem
        streetTextField.layer.cornerRadius = cornerRadius
        streetTextField.textAlignment = .center
        
        
        houseStreetTextField.translatesAutoresizingMaskIntoConstraints = false
        houseStreetTextField.placeholder = "Ваш будинок"
        houseStreetTextField.backgroundColor = backgroundColorOfIconItem
        houseStreetTextField.layer.cornerRadius = cornerRadius
        houseStreetTextField.textAlignment = .center
        
        roomTextField.translatesAutoresizingMaskIntoConstraints = false
        roomTextField.placeholder = "Квартира"
        roomTextField.backgroundColor = backgroundColorOfIconItem
        roomTextField.layer.cornerRadius = cornerRadius
        roomTextField.textAlignment = .center
        
        saveDataButton.translatesAutoresizingMaskIntoConstraints = false
        saveDataButton.setTitle("Зберегти", for: .normal)
        saveDataButton.setTitleColor(.white, for: .normal)
        saveDataButton.backgroundColor = .orange
        saveDataButton.layer.cornerRadius = cornerRadius
        saveDataButton.titleLabel?.textAlignment = .center
        
    }
    
    func layout() {
        view.addSubview(streetTextField)
        view.addSubview(houseStreetTextField)
        view.addSubview(roomTextField)
        view.addSubview(saveDataButton)
        
        let heightTextField: CGFloat = 30
        let widthTextField: CGFloat = view.frame.width / 100 * 75
        let centerX = view.centerXAnchor
        
        NSLayoutConstraint.activate([
            streetTextField.centerXAnchor.constraint(equalTo: centerX),
            streetTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            streetTextField.heightAnchor.constraint(equalToConstant: heightTextField),
            streetTextField.widthAnchor.constraint(equalToConstant: widthTextField)
        ])
        NSLayoutConstraint.activate([
            houseStreetTextField.centerXAnchor.constraint(equalTo: centerX),
            houseStreetTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 10),
            houseStreetTextField.heightAnchor.constraint(equalToConstant: heightTextField),
            houseStreetTextField.widthAnchor.constraint(equalToConstant: widthTextField)
        ])
        NSLayoutConstraint.activate([
            roomTextField.centerXAnchor.constraint(equalTo: centerX),
            roomTextField.topAnchor.constraint(equalTo: houseStreetTextField.bottomAnchor, constant: 10),
            roomTextField.heightAnchor.constraint(equalToConstant: heightTextField),
            roomTextField.widthAnchor.constraint(equalToConstant: widthTextField)
        ])
        NSLayoutConstraint.activate([
            saveDataButton.centerXAnchor.constraint(equalTo: centerX),
            saveDataButton.topAnchor.constraint(equalTo: roomTextField.bottomAnchor, constant: 10),
            saveDataButton.heightAnchor.constraint(equalToConstant: 35),
            saveDataButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2.25)
        ])
        
    }
    
}
