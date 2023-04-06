//
//  BonusPageViewController.swift
//  DailyFood
//
//  Created by m223 on 29.03.2023.
//

import UIKit

class BonusPageViewController: UIViewController {
    
    let cardView = UIView()
    var countBonusLabel = UILabel()
    let textUnderBonusLabel = UILabel()
    let numberOfCardBonusLabel = UILabel()
    let textBonusCard = UILabel()
    let barCodeLabel = UILabel()
    let barcodeImage = UIImageView()
    let infoAboutBonusCard = UILabel()
    let statusOfCardType = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мої бонуси"
        
        view.backgroundColor = .lightGray
        
        setup()
        layout()

    }
    
    
    func setup() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .brown
        cardView.layer.cornerRadius = 9
        cardView.clipsToBounds = true
        
        
        textBonusCard.translatesAutoresizingMaskIntoConstraints = false
        textBonusCard.text = "Картка бонусів"
        textBonusCard.textAlignment = .center
        textBonusCard.font = UIFont(name: "Georgia", size: 24)
        
        countBonusLabel.translatesAutoresizingMaskIntoConstraints = false
        countBonusLabel.text = "0"
        countBonusLabel.textAlignment = .left
        countBonusLabel.font = UIFont(name: "Georgia", size: 30)

        
        textUnderBonusLabel.translatesAutoresizingMaskIntoConstraints = false
        textUnderBonusLabel.text = "кількість бонусів"
        textUnderBonusLabel.textAlignment = .left
        textUnderBonusLabel.font = UIFont(name: "Georgia", size: 14)
        
        numberOfCardBonusLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCardBonusLabel.text = "1"
        
        
        barCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        barCodeLabel.text = "*штрих-код для зчитування в магазині"
        barCodeLabel.font = UIFont(name: "Georgia", size: 12)
        barCodeLabel.textAlignment = .right
        
        barcodeImage.translatesAutoresizingMaskIntoConstraints = false
        barcodeImage.image = UIImage(named: "barcode")
        
        infoAboutBonusCard.translatesAutoresizingMaskIntoConstraints = false
        infoAboutBonusCard.numberOfLines = 0
        infoAboutBonusCard.lineBreakMode = .byWordWrapping
        infoAboutBonusCard.font = UIFont(name: "Georgia", size: 16)
        infoAboutBonusCard.textAlignment = .center
        infoAboutBonusCard.text = "Бонусна програма дає змогу накопичувати бали при здійсненні покупок в застосунку. При здійсненні покупки 3% від суми зараховуються до картки бонусів. Бонуси можна витрачати при покупках як з сайту, так і в застосунку."
        
        statusOfCardType.translatesAutoresizingMaskIntoConstraints = false
        statusOfCardType.text = "Активована, йде списання бонусів"
        
        
        
    }
    
    func layout() {
        view.addSubview(cardView)
        cardView.addSubview(textBonusCard)
        cardView.addSubview(countBonusLabel)
        cardView.addSubview(textUnderBonusLabel)
        cardView.addSubview(barCodeLabel)
        cardView.addSubview(barcodeImage)
        view.addSubview(infoAboutBonusCard)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: view.bounds.height / 4),
            cardView.widthAnchor.constraint(equalToConstant: view.bounds.width - 30)
            
        ])
        NSLayoutConstraint.activate([
            textBonusCard.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            textBonusCard.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            textBonusCard.heightAnchor.constraint(equalToConstant: 25),
            textBonusCard.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            countBonusLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            countBonusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 45),
            countBonusLabel.heightAnchor.constraint(equalToConstant: 30),
            countBonusLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            textUnderBonusLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            textUnderBonusLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 75),
            textUnderBonusLabel.heightAnchor.constraint(equalToConstant: 30),
            textUnderBonusLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            barCodeLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            barCodeLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 4),
            barCodeLabel.heightAnchor.constraint(equalToConstant: 30),
            barCodeLabel.widthAnchor.constraint(equalToConstant: 350)
            
        ])
        
        NSLayoutConstraint.activate([
            barcodeImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            barcodeImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            barcodeImage.heightAnchor.constraint(equalToConstant: 45),
            barcodeImage.widthAnchor.constraint(equalTo: cardView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoAboutBonusCard.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 10),
            infoAboutBonusCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            infoAboutBonusCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        
        
    }

}
