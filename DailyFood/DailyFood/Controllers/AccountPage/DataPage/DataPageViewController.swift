//
//  DataPageViewController.swift
//  DailyFood
//
//  Created by m223 on 29.03.2023.
//

import UIKit

class DataPageViewController: UIViewController {
    
    //leading two elements from which all other labels and text fields will receive constraints
    let secondNameLabel = UILabel()
    let secondNameTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мої дані"
        view.backgroundColor = backgroundOfAllApps
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        setup()
        layout()

    }
    
    //MARK: - Default two function Setup and Layout
    
    func setup() {
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.text = "Прізвище"
        secondNameLabel.textAlignment = .center
        secondNameLabel.textColor = .black
        
        secondNameTextField.translatesAutoresizingMaskIntoConstraints = false
        secondNameTextField.backgroundColor = backgroundColorOfIconItem
        secondNameTextField.layer.cornerRadius = 16
        
    }
    //layout of two leading elements and creating new elements(label/textField) with special method
    func layout() {
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        
        let heightLabel: CGFloat = 30
        let widthLabel: CGFloat = view.frame.width / 100 * 75
        let heightTextField: CGFloat = 30
        let widthTextField: CGFloat = view.frame.width / 100 * 75
        let centerX = view.centerXAnchor
        
        NSLayoutConstraint.activate([
            secondNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            secondNameLabel.heightAnchor.constraint(equalToConstant: heightLabel),
            secondNameLabel.widthAnchor.constraint(equalToConstant: widthLabel)
        ])
        
        NSLayoutConstraint.activate([
            secondNameTextField.centerXAnchor.constraint(equalTo: centerX),
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 10),
            secondNameTextField.heightAnchor.constraint(equalToConstant: heightLabel),
            secondNameTextField.widthAnchor.constraint(equalToConstant: widthLabel)
        ])
        
        //label which creating with function "createLabel"
        let nameLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "Імʼя")
        let fatherNameLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "По-батькові")
        let numberPhoneLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "Номер телефону")
        let emailLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "Поштова скринька")
        let townLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "Місто")
        let dateOfBirthLabel = createLabel(withConstraints: [(centerX: centerX, height: heightLabel, width: widthLabel)], text: "Дата народження")
        
        //textField which creating with function "createTextField"
        let nameTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])
        let fatherNameTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])
        let numberPhoneTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])
        let emailTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])
        let townTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])
        let dateOfBirthTextField = createTextField(withConstraints: [(centerX: centerX, height: heightTextField, width: widthTextField)])

        
        //creating constraints for Label and TextField which created with own function "createLabel" and "createTextField"
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor)])
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)])
        NSLayoutConstraint.activate([fatherNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor)])
        NSLayoutConstraint.activate([fatherNameTextField.topAnchor.constraint(equalTo: fatherNameLabel.bottomAnchor)])
        NSLayoutConstraint.activate([numberPhoneLabel.topAnchor.constraint(equalTo: fatherNameTextField.bottomAnchor)])
        NSLayoutConstraint.activate([numberPhoneTextField.topAnchor.constraint(equalTo: numberPhoneLabel.bottomAnchor)])
        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: numberPhoneTextField.bottomAnchor)])
        NSLayoutConstraint.activate([emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor)])
        NSLayoutConstraint.activate([townLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor)])
        NSLayoutConstraint.activate([townTextField.topAnchor.constraint(equalTo: townLabel.bottomAnchor)])
        NSLayoutConstraint.activate([dateOfBirthLabel.topAnchor.constraint(equalTo: townTextField.bottomAnchor)])
        NSLayoutConstraint.activate([dateOfBirthTextField.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor)])
        
        
        
        
    }
    
    
    //MARK: - Some functions
    
    func createLabel(withConstraints constraints: [(centerX: NSLayoutXAxisAnchor, height: CGFloat, width: CGFloat)], text: String) -> UILabel{
        let label = UILabel()

        for constraint in constraints {
            label.text = text
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: constraint.centerX),
                label.heightAnchor.constraint(equalToConstant: constraint.height),
                label.widthAnchor.constraint(equalToConstant: constraint.width)
            ])
        }
        return label
    }
    
    //initializer for creating textFields
    func createTextField(withConstraints constraints: [(centerX: NSLayoutXAxisAnchor, height: CGFloat, width: CGFloat)]) -> UITextField{
        let textField = UITextField()

        for constraint in constraints {
            textField.textAlignment = .center
            textField.backgroundColor = backgroundColorOfIconItem
            textField.layer.cornerRadius = 16
            textField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(textField)
            
            NSLayoutConstraint.activate([
                textField.centerXAnchor.constraint(equalTo: constraint.centerX),
                textField.heightAnchor.constraint(equalToConstant: constraint.height),
                textField.widthAnchor.constraint(equalToConstant: constraint.width)
            ])
            

        }
        return textField
    }
    
}
