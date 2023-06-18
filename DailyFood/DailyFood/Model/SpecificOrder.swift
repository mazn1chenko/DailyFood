// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let specificOrder = try? JSONDecoder().decode(SpecificOrder.self, from: jsonData)

import Foundation

// MARK: - SpecificOrderElement
struct SpecificOrderElement: Codable {
    let orderID: Int?
    let order: JSONNull?
    let dishID: Int?
    let dish: JSONNull?
    let quantity, id: Int?

    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case order
        case dishID = "dishId"
        case dish, quantity, id
    }
}

typealias SpecificOrder = [SpecificOrderElement]
