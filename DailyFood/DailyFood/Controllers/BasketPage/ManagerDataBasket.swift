//
//  ManagerDataBasket.swift
//  DailyFood
//
//  Created by m223 on 11.04.2023.
//


//GlobalManagerArray - Class which managering data from bascket with which you can added items/foods in bascket, deleted from this list or create buy
import Foundation

class GlobalManagerArray {
    
    static let shared = GlobalManagerArray()
    
    
    //main array which contains added food/ He updating in real time when user remove from basket something
    var globalArray: SpecificTypeOfFood = []
    
    //method for calculating sum and price of item/foods which was added user
    func getSumOfItemPriceAndCount() -> (Int, Int) {
        
        var sum = 0
        
        var count = 0
        
        for i in globalArray {
            sum += i.price ?? 0
        }
        count = globalArray.count
        return (sum, count)
        
    }
    
    
    //method getting array for dispay on screen(BascketVS or something else)
    func getArray() -> [SpecificTypeOfFoodElement]{
        
        return globalArray
    }
    
    
    //method of adding food in basket
    func addDataInArray(data: SpecificTypeOfFoodElement){
        
        globalArray.append(data)

    }
    
    
    //method of remove food from basket
    func removeItem(removeItem: SpecificTypeOfFoodElement) {
        print(removeItem.id)
        if let index = globalArray.firstIndex(of: removeItem) {
            globalArray.remove(at: index)
        } else {
            print("Element not found in the array")
        }
    }
}
