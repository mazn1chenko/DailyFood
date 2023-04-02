//
//  Account.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit
import GoogleSignIn

class AccountViewController: UIViewController{
    
    var nameClientLabel = UILabel()
    let imageClientImage = UIImageView()
    let tableView = UITableView()
    let identifier = "MyCell"
    let arrayOfType = ["Мої закази","Мої дані","Мої бонуси","Адреса доставки", "Технічна підтримка","Увiйти в аккаунт"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Мій аккаунт"
        
        setup()
        layout()
        
    }
    
    func setup(){
        nameClientLabel.translatesAutoresizingMaskIntoConstraints = false
        nameClientLabel.textAlignment = .center
        nameClientLabel.text = "ІМ'Я ТА ПРІЗВИЩЕ"
        
        
        imageClientImage.translatesAutoresizingMaskIntoConstraints = false
        imageClientImage.image = UIImage(named: "accountBig")
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
    }
    
    func layout(){
        view.addSubview(nameClientLabel)
        view.addSubview(imageClientImage)
        view.addSubview(tableView)
        
        let param = view.frame.width / 4
        
        NSLayoutConstraint.activate([
            imageClientImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageClientImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            imageClientImage.heightAnchor.constraint(equalToConstant: param),
            imageClientImage.widthAnchor.constraint(equalToConstant: param)
                
        ])
        
        NSLayoutConstraint.activate([
            nameClientLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameClientLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5 + param),
            nameClientLabel.heightAnchor.constraint(equalToConstant: 25),
            nameClientLabel.widthAnchor.constraint(equalToConstant: 300)
        
        
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25 + 5 + param),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                                             
        
        ])
        
    }
    
    
}

extension AccountViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            navigationController?.pushViewController(OrdersPageViewController(), animated: false)
            
        case 1:
            navigationController?.pushViewController(DataPageViewController(), animated: false)
            
        case 2:
            navigationController?.pushViewController(BonusPageViewController(), animated: false)
            
                        
        case 3:
            navigationController?.pushViewController(DeliveryPageViewController(), animated: false)
            
                        
        case 4:
            navigationController?.pushViewController(TechHelpPageViewController(), animated: false)
            
        case 5:
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                guard error == nil else { return }
                
                // If sign in succeeded, display the app's main content View.
                guard let signInResult = signInResult else { return }
                
                let user = signInResult.user
                
                
                
                //let emailAddress = user.profile?.email
                
                let fullName = user.profile?.name
                
                if fullName == fullName {
                    self.nameClientLabel.text = "\(String(describing: fullName!))"
                    
                } else {
                    self.nameClientLabel.text = "ІМ'Я ТА ПРІЗВИЩЕ"
                }
//                let givenName = user.profile?.givenName
//                let familyName = user.profile?.familyName
//
//                let profilePicUrl = user.profile?.imageURL(withDimension: 320)
                
            }
            
            
        default: break
        }
            
    }
    
}

extension AccountViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfType.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: AccountViewCell.reuseID, for: indexPath) as? AccountViewCell
        //cell!.configureCell(model: arrayOfType[indexPath.row])
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let nameOfType = UILabel(frame: CGRectMake(25.0, 32.5, 300.0, 25.0))
        nameOfType.text = arrayOfType[indexPath.row]
        nameOfType.font = UIFont(name: "Inter-Regular", size: 17)
        cell.backgroundColor = .lightGray
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemYellow
        cell.selectedBackgroundView = backgroundView
        
        nameOfType.tag = indexPath.row
        cell.contentView.addSubview(nameOfType)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
 
}
