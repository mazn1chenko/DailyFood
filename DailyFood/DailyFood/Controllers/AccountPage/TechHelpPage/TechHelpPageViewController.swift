//
//  TechHelpPageViewController.swift
//  DailyFood
//
//  Created by m223 on 29.03.2023.
//

import UIKit


class TechHelpPageViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    let questionTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Технічна підтримка"
        view.backgroundColor = backgroundOfAllApps
        
        setup()
        layout()
    }
    
    func setup() {
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor = backgroundColorOfIconItem
        nameTextField.layer.cornerRadius = 4
        nameTextField.font = UIFont(name: "American Typewriter", size: 16)
        nameTextField.returnKeyType = .next
        nameTextField.tag = 1
        nameTextField.delegate = self
        nameTextField.textColor = .black
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Ваше імʼя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 14) as Any]
        )
        
        emailTextField.placeholder = "Ваша поштова скринька"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = backgroundColorOfIconItem
        emailTextField.layer.cornerRadius = 4
        emailTextField.font = UIFont(name: "American Typewriter", size: 16)
        emailTextField.returnKeyType = .next
        emailTextField.tag = 2
        emailTextField.delegate = self
        emailTextField.textColor = .black
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Введіть поштову скриньку",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 14) as Any]
        )
        
        questionTextView.translatesAutoresizingMaskIntoConstraints = false
        questionTextView.backgroundColor = backgroundColorOfIconItem
        questionTextView.layer.cornerRadius = 4
        questionTextView.font = UIFont(name: "American Typewriter", size: 16)
        questionTextView.autocorrectionType = .yes
        questionTextView.returnKeyType = .send
        questionTextView.tag = 3
        questionTextView.delegate = self
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if questionTextView.textColor == UIColor.black {
                questionTextView.text = nil
                questionTextView.textColor = UIColor.black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if questionTextView.text.isEmpty {
                questionTextView.text = "Опишіть вашу проблему"
                questionTextView.textColor = UIColor.black
            }
        }
        
        
    }
    
    func layout() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(questionTextView)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25)
            
        ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25)
            
        ])
        NSLayoutConstraint.activate([
            questionTextView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            questionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            questionTextView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            questionTextView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
    //when we want`s to go to next textField, we need to use this functions, which can remove us to next textField when we tapped
    //on button from prop "ReturnKeyType"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }

}
