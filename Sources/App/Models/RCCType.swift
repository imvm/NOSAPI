//
//  RCCType.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Foundation

import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class RCCType: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    var name: String
    var description: String
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

extension RCCType: Migration { }
extension RCCType: Content { }
extension RCCType: Parameter { }

