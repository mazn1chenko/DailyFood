//
//  ManagerDataBasket.swift
//  DailyFood
//
//  Created by m223 on 11.04.2023.
//

import Foundation

class GlobalManagerArray {
    
    static let shared = GlobalManagerArray()
    
    var globalArray = [ModelFood]()
    
    func getArray() -> [ModelFood]{
        
        return globalArray
    }
    
    func addDataInArray(data: ModelFood){
        
        globalArray.append(data)

    }
    
    
    
    
}
