//
//  LaunchScreenView.swift
//  DailyFood
//
//  Created by m223 on 01.04.2023.
//

import UIKit

class LaunchScreenView: UIViewController {
    
    let viewScreenImage = UIImageView(image: UIImage(named: "launchScreen"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.isNavigationBarHidden = true

        setup()
        layout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.pushMainWindow()
        }
        

    }
    
    func setup(){
                
        viewScreenImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    func layout(){
        view.addSubview(viewScreenImage)
        
        NSLayoutConstraint.activate([
            viewScreenImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewScreenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewScreenImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 3),
            viewScreenImage.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
            
        ])
        
    }
    
    func pushMainWindow(){
        
        navigationController?.pushViewController(LogInViewController(), animated: true)
        
    }

}
