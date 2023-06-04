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
        
    func getSumOfItemPriceAndCount() -> (Int, Int) {
        
        var sum = 0
        
        var count = 0
        
        for i in globalArray {
            var str = i.priceOfFood
            str?.removeLast(2)
            sum += Int(str!)!
        }
        count = globalArray.count
        return (sum, count)
        
    }
    
    func getArray() -> [ModelFood]{
        
        return globalArray
    }
    
    func addDataInArray(data: ModelFood){
        
        globalArray.append(data)

    }
    
    func removeItem(removeItem: ModelFood){
        
        if let index = globalArray.firstIndex(of: removeItem) {
            globalArray.remove(at: index)
        }else{
            print("Something happens")
        }
        
    }
}
