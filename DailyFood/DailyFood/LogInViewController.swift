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
    var logInButton = UIButton(type: .system)
    var registrButton = UIButton(type: .system)
    var askAboutRegistrLabel = UILabel()
    var imageDailyFood = UIImageView(image: UIImage(named: "launchScreen"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()

    }
    
    func setup() {
        imageDailyFood.translatesAutoresizingMaskIntoConstraints = false
        
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        logInLabel.text = "Логін"
        logInLabel.textColor = .black
        logInLabel.textAlignment = .center
        logInLabel.font = UIFont.systemFont(ofSize: 17)
        
        logInTextField.translatesAutoresizingMaskIntoConstraints = false
        logInTextField.backgroundColor = .lightGray
        logInTextField.layer.cornerRadius = 16
        logInTextField.delegate = self
        
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Пароль"
        passwordLabel.textColor = .black
        passwordLabel.textAlignment = .center
        passwordLabel.font = UIFont.systemFont(ofSize: 17)

        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Увійти", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = .lightGray
        logInButton.layer.cornerRadius = 16
        logInButton.addTarget(self, action: #selector(logInButton(action:)), for: .touchUpInside)
        
        registrButton.translatesAutoresizingMaskIntoConstraints = false
        registrButton.setTitle("Зареєструватись", for: .normal)
        registrButton.backgroundColor = .orange
        registrButton.setTitleColor(.white, for: .normal)
        registrButton.layer.cornerRadius = 16
        registrButton.addTarget(self, action: #selector(registrButton(action:)), for: .touchUpInside)
        
        askAboutRegistrLabel.translatesAutoresizingMaskIntoConstraints = false
        askAboutRegistrLabel.text = "Ще не зареєстровані в додатку?"
        askAboutRegistrLabel.textColor = .orange
        askAboutRegistrLabel.textAlignment = .center
        
    }
    
    
    func layout() {
        view.addSubview(logInLabel)
        view.addSubview(logInTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(registrButton)
        view.addSubview(askAboutRegistrLabel)
        view.addSubview(imageDailyFood)
        
        let heightLabel: CGFloat = 20
        let heightTextField: CGFloat = 30
        let heightButton: CGFloat = 35
        
        NSLayoutConstraint.activate([
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            logInLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            logInLabel.heightAnchor.constraint(equalToConstant: heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            logInTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInTextField.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 10),
            logInTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 100 * 75),
            logInTextField.heightAnchor.constraint(equalToConstant: heightTextField)
            
        ])
        NSLayoutConstraint.activate([
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordLabel.topAnchor.constraint(equalTo: logInTextField.bottomAnchor, constant: 10),
            passwordLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            passwordLabel.heightAnchor.constraint(equalToConstant: heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 100 * 75),
            passwordTextField.heightAnchor.constraint(equalToConstant: heightTextField)
            
        ])
        
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            logInButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            logInButton.heightAnchor.constraint(equalToConstant: heightButton)
        ])
        
        NSLayoutConstraint.activate([
            registrButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            registrButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2.25),
            registrButton.heightAnchor.constraint(equalToConstant: heightButton)
            
        ])
        
        NSLayoutConstraint.activate([
            askAboutRegistrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askAboutRegistrLabel.bottomAnchor.constraint(equalTo: registrButton.topAnchor, constant: -10),
            askAboutRegistrLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            askAboutRegistrLabel.heightAnchor.constraint(equalToConstant: heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            imageDailyFood.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageDailyFood.topAnchor.constraint(equalTo: view.topAnchor),
            imageDailyFood.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            imageDailyFood.widthAnchor.constraint(equalToConstant: view.frame.width / 2)

            
        ])
        
    }
    
    @objc func logInButton(action: UIButton){
        
        func alertError() {
            let alert = UIAlertController(title: "Помилка!", message: "Невірно введений логін чи пароль", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Спробувати ще", style: .cancel)
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
            
        }
        
        let passwordAdmin = "admin"
        if action == action {
            if logInTextField.text == passwordAdmin {
                if passwordTextField.text == passwordAdmin{
                    navigationController?.pushViewController(TabBarController(), animated: true)
                } else { return alertError() }
            } else { return alertError() }
        }
        
        
    }
    
    @objc func registrButton(action: UIButton){
        if action == action {
            let url = URL(string: "https://www.instagram.com/ivan_vondert/")!
            UIApplication.shared.open(url)
        }
        
    }

}
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}








