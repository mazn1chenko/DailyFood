//
//  Main.swift
//  DailyFood
//
//  Created by m223 on 16.03.2023.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController{
    
    let searchBarController = UISearchController()
            
    private var collectionView: UICollectionView?
    
    let layoutFLow = UICollectionViewFlowLayout()


    
    //Testing topy of food while not ready back-end
    let menuFood = ["Перші блюда","Гарніри","Салати","Холодні закуски","Напої","Десерти","Сніданки","Дитяче","Від Шефа","Мʼясне",]
    let menuFoodImage = ["firstPNG", "garnirPNG", "saladPNG", "snackPNG", "coctailsPNG", "dessertPNG", "breakfastPNG", "babyPNG", "cheffPNG", "meatsPNG"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "DailyFood"
        
        view.backgroundColor = backgroundOfAllApps
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        setup()
        layout()
        checkForPermission()
                
        //settings NavControlller(small changes)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20) as Any]
        navigationItem.backBarButtonItem?.tintColor = .gray
        navigationController?.navigationBar.barTintColor = backgroundOfAllApps
        

        
    }
    
    //MARK: - Default two function Setup and Layout 
    func setup() {
              
        layoutFLow.scrollDirection = .vertical
        layoutFLow.minimumLineSpacing = 8
        layoutFLow.minimumInteritemSpacing = 1
        layoutFLow.itemSize = CGSize(width: (view.frame.size.width / 2) - 15,
                                 height: (view.frame.size.width / 2) - 15)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutFLow)

        guard let collectionView = collectionView else {return}
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = backgroundOfAllApps
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseID)

        
    }
    
    func layout() {
        view.addSubview(collectionView!)

        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
        
    }
    
    
    
    func searchBurSettings() {
        
        
        navigationItem.searchController = searchBarController
        
        let searchBur = UISearchBar()
        navigationController?.navigationItem.titleView = searchBur
        

    }
    
    
    //MARK: - Notification
    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow{
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
        
    }
    
    func dispatchNotification() {
        let identifier = "Reminder"
        let title = "Є цікаві знижки!"
        let body = "Ми приготували для тебе дещо цікавеньке"
        let hour = 13
        let minute = 15
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
}

//MARK: - Extensions

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseID, for: indexPath) as? MenuCollectionViewCell
        
        cell!.configureCollectionCell(model: menuFood[indexPath.row], image: menuFoodImage[indexPath.row])
        return cell!
        
    }
    
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TypeOfFoodSelected()
        vc.navigationItem.title = menuFood[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
