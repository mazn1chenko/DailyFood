//
//  DataManager.swift
//  DailyFood
//
//  Created by m223 on 15.06.2023.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    var typeOfFood: TypeOfFoodAPI = []
    var specificFood: SpecificTypeOfFood = []
    var infoAboutOrders: AllOrdersOfUser = []
    var name : String?
    var surname : String?
    
    func fetchTypeOfFoodAndAllSpecificFood(completion: @escaping () -> Void) {
        
        ApiManager.shared.gettingTypeOfFood { typeOfProduct in
            self.typeOfFood = typeOfProduct
            completion()
            self.fetchInfoUser {
                
            }
        }
        
        ApiManager.shared.gettingSpecificTypeOfFood { specificProducts in
            self.specificFood = specificProducts
            completion()
        }
    }
    
    func fetchInfoOrdersOfUser(completion: @escaping () -> Void){
        
        ApiManager.shared.gettingAllOrdersOfUser { allOrders in
            self.infoAboutOrders = allOrders
            print(self.infoAboutOrders)
            completion()
        }
    }
    
    func fetchInfoUser(comletion: @escaping () -> Void){
        self.name = ApiManager.shared.nameOfUser
        self.surname = ApiManager.shared.surnameOfUser
        
    }
    
}
