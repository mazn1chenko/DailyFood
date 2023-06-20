// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allOrdersOfUser = try? JSONDecoder().decode(AllOrdersOfUser.self, from: jsonData)

import Foundation

// MARK: - AllOrdersOfUserElement
struct AllOrdersOfUserElement: Codable {
    let userID: Int?
    let user: JSONNull?
    let courierID: Int?
    let courier: JSONNull?
    let sum: Int?
    let bonusesAmount: Double?
    let startAddress, endAddress: String?
    let status: Bool?
    let startTime: String?
    let endTime: String?
    let orderParts: [JSONAny]?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case user
        case courierID = "courierId"
        case courier, sum, bonusesAmount, startAddress, endAddress, status, startTime, endTime, orderParts, id
    }
}

typealias AllOrdersOfUser = [AllOrdersOfUserElement]

