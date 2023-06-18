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
    //var AllIDOfOrders = [Int]()
    var allSpecificAboutOrder: SpecificOrder = []
    var dishIDArray = [Int]()
    var sortedArrayOfSpecificFoodOfID : SpecificTypeOfFood = []
    
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
    
    func fetchInfoOrdersOfUser(completion: @escaping () -> Void) {
        let group = DispatchGroup()
        
        ApiManager.shared.gettingAllOrdersOfUser { allOrders in
            self.infoAboutOrders = allOrders
            if self.infoAboutOrders.count > 0 {
                for b in self.infoAboutOrders {
                    group.enter()
                    ApiManager.shared.gettingSpecificDataOfUserOrders(headerOfId: b.id!) { specificElement in
                        self.allSpecificAboutOrder.append(contentsOf: specificElement)
                        for i in self.allSpecificAboutOrder {
                            self.dishIDArray.append(i.dishID!)
                        }
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    self.fetchTypeOfFoodAndAllSpecificFood {
                        self.sortedArrayOfSpecificFoodOfID = self.specificFood.filter { self.dishIDArray.contains($0.id!) }
                        print("Это массив когда уже приходит в ДатаМенеджер: \(self.sortedArrayOfSpecificFoodOfID.count)")
                        completion()
                    }
                }
            } else {
                completion()
            }
        }
    }







        
        func fetchInfoUser(comletion: @escaping () -> Void){
            self.name = ApiManager.shared.nameOfUser
            self.surname = ApiManager.shared.surnameOfUser
            
        }
        
        //    func fetchDataOfSpecificOrder(completion: @escaping () -> Void){
        //        for i in AllIDOfOrders {
        //            print("I - которое приходит с даты в Апи с эррея \(i)")
        //            ApiManager.shared.gettingSpecificDataOfUserOrders(headerOfId: i) { specificOrderElement in
        //                self.allSpecificAboutOrder.append(specificOrderElement)
        //            }
        //        }
        //
        //    }
        
    }

