//
//  SpecificTypeOfFood.swift
//  DailyFood
//
//  Created by m223 on 15.06.2023.
//

import Foundation

// MARK: - SpecificTypeOfFoodElement
struct SpecificTypeOfFoodElement: Codable, Equatable {
    static func == (lhs: SpecificTypeOfFoodElement, rhs: SpecificTypeOfFoodElement) -> Bool {
        return lhs.id == rhs.id
    }
    

    
    var name: String?
    var price, categoryID: Int?
    var category: JSONNull?
    var image: String?
    var orderParts: [JSONAny]?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case name, price
        case categoryID = "categoryId"
        case category, image, orderParts, id
    }
}

typealias SpecificTypeOfFood = [SpecificTypeOfFoodElement]
