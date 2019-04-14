//
//  TransportRequest.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class TransportRequest: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    var constructionManagerId: Int
    var constructionSiteId: Int
    var transporterId: Int
    var RCCTypeIds: [Int]
    var quantity: Double
    var date: Date
    var delivered: Bool? = false
    var cancelled: Bool? = false
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, constructionManagerId: Int, constructionSiteId: Int, transporterId: Int, RCCTypeIds: [Int], quantity: Double, date: Date) {
        self.id = id
        self.constructionManagerId = constructionManagerId
        self.constructionSiteId = constructionSiteId
        self.transporterId = transporterId
        self.RCCTypeIds = RCCTypeIds
        self.quantity = quantity
        self.date = date
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension TransportRequest: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension TransportRequest: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension TransportRequest: Parameter { }

