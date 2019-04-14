//
//  DestinationController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import FluentPostgreSQL
import Vapor

final class Destination: PostgreSQLModel {
    var id: Int?
    var name: String
    var address: Address
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, address: Address) {
        self.id = id
        self.name = name
        self.address = address
    }
}

extension Destination: Migration { }
extension Destination: Content { }
extension Destination: Parameter { }

