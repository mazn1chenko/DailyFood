//
//  AllOrdersOfUserModel.swift
//  DailyFood
//
//  Created by m223 on 17.06.2023.
//
import Foundation

// MARK: - AllOrdersOfUserElement
struct AllOrdersOfUserElement: Codable {
    let userID: Int?
    let user, courierID, courier: JSONNull?
    let startAddress, endAddress: String?
    let status: Bool?
    let startTime, endTime: String?
    let orderParts: [JSONAny]?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case user
        case courierID = "courierId"
        case courier, startAddress, endAddress, status, startTime, endTime, orderParts, id
    }
}

typealias AllOrdersOfUser = [AllOrdersOfUserElement]
