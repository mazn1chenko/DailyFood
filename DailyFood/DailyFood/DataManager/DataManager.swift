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
            print("Сработала функция внутри ДатаМенеджера класса колво типов функций\(self.typeOfFood.count)")
            completion()
        }
        
        ApiManager.shared.gettingSpecificTypeOfFood { specificProducts in
            self.specificFood = specificProducts
            print("Сработала функция внутри ДатаМенеджера класса колво типов функций\(self.specificFood.count)")
            completion()
        }
    }
}
