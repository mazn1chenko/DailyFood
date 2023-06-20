//
//  PayViewController.swift
//  DailyFood
//
//  Created by m223 on 18.06.2023.
//

import Foundation
import UIKit

class PayViewController: UIViewController, UITextFieldDelegate{
    
    var viewStackUIView = UIView()
    let textAboutBanksCardLabel = UILabel()
    let numberOfCardTextField = UITextField()
    let dateOfCardTextField = UITextField()
    let dateTextFieldDelegate = DateTextFieldDelegate()
    let pincodeOfCardTextField = UITextField()
    let confirmButton = UIButton(type: .system)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "Оплата"
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
        //sendPUTRequest()
        
    }
    
    
    
//    func sendPUTRequest() {
//        let url = URL(string: "http://20.4.124.65/orders/idEndTime/2")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "PUT"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let json: [String: Any] = ["endTime": "2023-12-12"]
//        let jsonData = try? JSONSerialization.data(withJSONObject: json)
//        request.httpBody = jsonData
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            // Обработка ответа
//            if let error = error {
//                print("Ошибка: \(error)")
//                return
//            }
//
//            if let data = data {
//                let responseString = String(data: data, encoding: .utf8)
//                print("Ответ сервера: \(responseString ?? "")")
//            }
//        }
//        task.resume()
//    }

    func setup(){
        
        viewStackUIView.translatesAutoresizingMaskIntoConstraints = false
        viewStackUIView.backgroundColor = .black
        viewStackUIView.layer.cornerRadius = 10
        
        textAboutBanksCardLabel.translatesAutoresizingMaskIntoConstraints = false
        textAboutBanksCardLabel.text = "Введіть данні картки"
        textAboutBanksCardLabel.textColor = .white
        textAboutBanksCardLabel.textAlignment = .center
        
        numberOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfCardTextField.placeholder = "Введіть номер картки"
        numberOfCardTextField.textColor = .white
        numberOfCardTextField.textAlignment = .center
        numberOfCardTextField.delegate = self
        
        
        dateOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfCardTextField.placeholder = "Срок дії"
        dateOfCardTextField.textAlignment = .center
        dateOfCardTextField.delegate = dateTextFieldDelegate
        
        pincodeOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        pincodeOfCardTextField.placeholder = "Пін картки"
        pincodeOfCardTextField.textAlignment = .center
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.backgroundColor = .black
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.cornerRadius = 10
        confirmButton.addTarget(self, action: #selector(confirmButtonValidation(action:)), for: .touchUpInside)
        
    }
    
    func layout(){
        view.addSubview(viewStackUIView)
        viewStackUIView.addSubview(textAboutBanksCardLabel)
        viewStackUIView.addSubview(numberOfCardTextField)
        viewStackUIView.addSubview(dateOfCardTextField)
        viewStackUIView.addSubview(pincodeOfCardTextField)
        view.addSubview(confirmButton)

        
        let bottomAnchorOfDateAndPin: CGFloat = 20
        let heightOfAllTextField: CGFloat = 25
        let widht: CGFloat = view.frame.width / 1.1
        
        NSLayoutConstraint.activate([
            viewStackUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            viewStackUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewStackUIView.heightAnchor.constraint(equalToConstant: view.frame.height / 6),
            viewStackUIView.widthAnchor.constraint(equalToConstant: widht)
        ])
        
        NSLayoutConstraint.activate([
            textAboutBanksCardLabel.topAnchor.constraint(equalTo: viewStackUIView.topAnchor, constant: 10),
            textAboutBanksCardLabel.centerXAnchor.constraint(equalTo: viewStackUIView.centerXAnchor),
            textAboutBanksCardLabel.heightAnchor.constraint(equalToConstant: 20),
            textAboutBanksCardLabel.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
            
        ])
        
        NSLayoutConstraint.activate([
            numberOfCardTextField.topAnchor.constraint(equalTo: textAboutBanksCardLabel.bottomAnchor, constant: 20),
            numberOfCardTextField.centerXAnchor.constraint(equalTo: viewStackUIView.centerXAnchor),
            numberOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField),
            numberOfCardTextField.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
        ])
        
        NSLayoutConstraint.activate([
            dateOfCardTextField.bottomAnchor.constraint(equalTo: viewStackUIView.bottomAnchor, constant: -bottomAnchorOfDateAndPin),
            dateOfCardTextField.centerXAnchor.constraint(equalTo: textAboutBanksCardLabel.leadingAnchor),
            dateOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField),
            dateOfCardTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 4)

        ])
        
        NSLayoutConstraint.activate([
            pincodeOfCardTextField.bottomAnchor.constraint(equalTo: viewStackUIView.bottomAnchor, constant: -bottomAnchorOfDateAndPin),
            pincodeOfCardTextField.centerXAnchor.constraint(equalTo: textAboutBanksCardLabel.trailingAnchor),
            pincodeOfCardTextField.heightAnchor.constraint(equalToConstant: heightOfAllTextField),
            pincodeOfCardTextField.widthAnchor.constraint(equalToConstant: view.bounds.width / 4)

        ])
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: viewStackUIView.bottomAnchor, constant: 20),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 35),
            confirmButton.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5)
        ])
        
    }
        //MARK: - Objc func for targer
        
    @objc func confirmButtonValidation(action: UIButton){
        
        if isValidCardNumber(numberOfCardTextField.text!) && validateDateInput(dateText: dateOfCardTextField.text!) {
            
            alertError(title: "Все добре, я вже спиздив твої гроші")
        }else {
            alertError(title: "Я не можу спиздити твої гроші, бо ти бовдур не вказав правильні дані")
            
        }
        
    }
    
    
    //MARK: - Some function
    
    func alertError(title: String) {
        let alert = UIAlertController(title: "Помилка!", message: title, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ок", style: .cancel)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
    }
        
    func isValidCardNumber(_ cardNumber: String) -> Bool {
        
        let trimmedCardNumber = cardNumber.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
        
        
        let cardNumberRegex = "^[0-9]{13,19}$"
        let cardNumberPredicate = NSPredicate(format: "SELF MATCHES %@", cardNumberRegex)
        let isValidCardNumber = cardNumberPredicate.evaluate(with: trimmedCardNumber)
        
        if !isValidCardNumber {
            return false
        }
        
        
        var sum = 0
        let reversedCardNumber = String(trimmedCardNumber.reversed())
        for (index, character) in reversedCardNumber.enumerated() {
            guard let digit = Int(String(character)) else { return false }
            if index % 2 == 1 {
                let doubledDigit = digit * 2
                sum += doubledDigit > 9 ? doubledDigit - 9 : doubledDigit
            } else {
                sum += digit
            }
        }
        
        return sum % 10 == 0
    }
    
    
    
    func validateDateInput(dateText: String) -> Bool {
        let components = dateText.split(separator: "/")
        guard components.count == 2,
              let month = Int(components[0]),
              let year = Int(components[1]) else {
            return false
        }
        
        if !(month >= 1 && month <= 12) || !(year >= 23 && year <= 33) {
            return false
        }
        
        return true
    }
    
    
}

class DateTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let maxLength = 5 // maxInput = 5
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let currentText = textField.text {

            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            

            let digitOnly = updatedText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            // Проверяем, не превышает ли длина вводимой даты maxLength
            if digitOnly.count > maxLength {
                return false
            }
            
            // Форматируем текст даты добавлением слеша после второго символа
            var formattedText = ""
            let digits = Array(digitOnly)
            for index in 0..<digits.count {
                if index == 2 {
                    formattedText += "/"
                }
                formattedText += String(digits[index])
            }
            
            // Устанавливаем отформатированный текст в поле ввода
            textField.text = formattedText
            
            return false // Возвращаем false, чтобы не обрабатывать ввод замены символов
        }
        
        return true
    }
    
}
