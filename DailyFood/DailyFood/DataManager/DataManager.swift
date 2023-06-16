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
    
    func fetch(completion: @escaping () -> Void) {
        
        ApiManager.shared.gettingTypeOfFood { typeOfProduct in
            self.typeOfFood = typeOfProduct
            completion()
        }
        
        ApiManager.shared.gettingSpecificTypeOfFood { specificProducts in
            self.specificFood = specificProducts
            completion()
        }
    }
}
