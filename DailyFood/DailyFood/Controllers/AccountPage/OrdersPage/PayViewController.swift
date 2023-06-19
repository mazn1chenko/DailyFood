//
//  PayViewController.swift
//  DailyFood
//
//  Created by m223 on 18.06.2023.
//

import Foundation
import UIKit

class PayViewController: UIViewController{
    
    var stackViewWithTextFieldOfCard = UIStackView()
    var textAboutBanksCardLabel = UILabel()
    var numberOfCardTextField = UITextField()
    var dateOfCardTextField = UITextField()
    var pincodeOfCardTextField = UITextField()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "Оплата"
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
    }
    
    func setup(){
        
        stackViewWithTextFieldOfCard.translatesAutoresizingMaskIntoConstraints = false
        stackViewWithTextFieldOfCard.backgroundColor = .yellow
        stackViewWithTextFieldOfCard.layer.cornerRadius = 10
        
        textAboutBanksCardLabel.translatesAutoresizingMaskIntoConstraints = false
        textAboutBanksCardLabel.text = "Введіть данні картки"
        textAboutBanksCardLabel.textColor = .black
        
        numberOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfCardTextField.placeholder = "Введіть номер картки"
        
        dateOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfCardTextField.placeholder = "Срок дії"
        
        pincodeOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        pincodeOfCardTextField.placeholder = "Пін картки"
        
        
        
    }
    
    func layout(){
        view.addSubview(stackViewWithTextFieldOfCard)
        stackViewWithTextFieldOfCard.addSubview(textAboutBanksCardLabel)
        stackViewWithTextFieldOfCard.addSubview(numberOfCardTextField)
        stackViewWithTextFieldOfCard.addSubview(dateOfCardTextField)
        stackViewWithTextFieldOfCard.addSubview(pincodeOfCardTextField)
        
        let bottomAnchorOfDateAndPin: CGFloat = 20
        let heightOfAllTextField: CGFloat = 25
        
        NSLayoutConstraint.activate([
            stackViewWithTextFieldOfCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            stackViewWithTextFieldOfCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewWithTextFieldOfCard.heightAnchor.constraint(equalToConstant: view.frame.height / 3.5),
            stackViewWithTextFieldOfCard.widthAnchor.constraint(equalToConstant: view.frame.width / 1.1)
            
        ])
        
        NSLayoutConstraint.activate([
            textAboutBanksCardLabel.topAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.topAnchor, constant: 10),
            textAboutBanksCardLabel.centerXAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.centerXAnchor),
            textAboutBanksCardLabel.heightAnchor.constraint(equalToConstant: 20),
            textAboutBanksCardLabel.widthAnchor.constraint(equalToConstant: stackViewWithTextFieldOfCard.frame.width / 2)
        
        ])
        
        NSLayoutConstraint.activate([
            numberOfCardTextField.centerXAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.centerXAnchor),
            numberOfCardTextField.topAnchor.constraint(equalTo: textAboutBanksCardLabel.bottomAnchor, constant: 20),
            numberOfCardTextField.widthAnchor.constraint(equalToConstant: stackViewWithTextFieldOfCard.frame.width / 2),
            numberOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField)
        ])
        
        NSLayoutConstraint.activate([
            dateOfCardTextField.bottomAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.bottomAnchor, constant: bottomAnchorOfDateAndPin),
            dateOfCardTextField.centerXAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.centerXAnchor),
            dateOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField),
            dateOfCardTextField.widthAnchor.constraint(equalToConstant: stackViewWithTextFieldOfCard.frame.width / 3)

        ])
        
        NSLayoutConstraint.activate([
            pincodeOfCardTextField.bottomAnchor.constraint(equalTo: stackViewWithTextFieldOfCard.bottomAnchor, constant: bottomAnchorOfDateAndPin),
            pincodeOfCardTextField.centerXAnchor.constraint(equalTo: textAboutBanksCardLabel.leadingAnchor),
            pincodeOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField),
            pincodeOfCardTextField.widthAnchor.constraint(equalToConstant: stackViewWithTextFieldOfCard.bounds.width / 3)


        ])
        
    }
    
}
