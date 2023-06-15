// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let typeOfFoodAPI = try? JSONDecoder().decode(TypeOfFoodAPI.self, from: jsonData)

import Foundation

// MARK: - TypeOfFoodAPIElement
struct TypeOfFoodAPIElement: Codable {
    let name: String?
    let bonusCoefficient: Double?
    let dishes: [JSONAny]?
    let id: Int?
}

typealias TypeOfFoodAPI = [TypeOfFoodAPIElement]

