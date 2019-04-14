//
//  ConstructionSite.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class ConstructionSite: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    var name: String
    var address: Address
    var transportRequestsIds: [Int]? = []
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, address: Address) {
        self.id = id
        self.name = name
        self.address = address
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension ConstructionSite: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension ConstructionSite: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension ConstructionSite: Parameter { }

