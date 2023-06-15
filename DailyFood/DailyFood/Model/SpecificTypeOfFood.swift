//
//  SpecificTypeOfFood.swift
//  DailyFood
//
//  Created by m223 on 15.06.2023.
//

import Foundation

// MARK: - SpecificTypeOfFoodElement
struct SpecificTypeOfFoodElement: Codable {

    
    let name: String?
    let price, categoryID: Int?
    let category: JSONNull?
    let image: String?
    let orderParts: [JSONAny]?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case name, price
        case categoryID = "categoryId"
        case category, image, orderParts, id
    }
}

typealias SpecificTypeOfFood = [SpecificTypeOfFoodElement]
