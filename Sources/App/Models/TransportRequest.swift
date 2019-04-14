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
    var transporterId: Int
    var constructionSiteId: Int
    var destinationId: Int
    var RCCTypeIds: [Int]
    var quantity: Double
    var dateRequested: Date
    var dateDelivered: Date?
    var delivered: Bool? = false
    var cancelled: Bool? = false
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, constructionManagerId: Int, transporterId: Int, constructionSiteId: Int, destinationId: Int, RCCTypeIds: [Int], quantity: Double, dateRequested: Date) {
        self.id = id
        self.constructionManagerId = constructionManagerId
        self.transporterId = transporterId
        self.constructionSiteId = constructionSiteId
        self.destinationId = destinationId
        self.RCCTypeIds = RCCTypeIds
        self.quantity = quantity
        self.dateRequested = dateRequested
    }
}

extension TransportRequest: Migration { }
extension TransportRequest: Content { }
extension TransportRequest: Parameter { }

