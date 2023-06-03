//
//  LogInViewController.swift
//  DailyFood
//
//  Created by m223 on 03.06.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    var logInLabel = UILabel()
    var logInTextField = UITextField()
    var passwordLabel = UILabel()
    var passwordTextField = UITextField()
    var logInButton = UIButton()
    var registrButton = UIButton()
    var askAboutRegistrLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()

    }
    
    func setup() {
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        logInLabel.text = "Логін"
        logInLabel.tintColor = .black
        
        logInTextField.translatesAutoresizingMaskIntoConstraints = false
        logInTextField.backgroundColor = .lightGray
        
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Пароль"
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Увійти", for: .normal)
        logInButton.backgroundColor = .gray
        
        
        
    }
    
    func layout() {
        view.addSubview(logInLabel)
        view.addSubview(logInTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logInLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 5),
            logInLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            logInTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInTextField.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 10),
            logInTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            logInTextField.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
        
    }

}
