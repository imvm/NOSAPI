//
//  ConstructionManager.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class ConstructionManager: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    var name: String
    var CPF: String?
    var CNPJ: String?
    var phone: String?
    
    var constructionSiteIds: [Int]? = []
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, name: String, CPF: String, CNPJ: String?, phone: String?) {
        self.id = id
        self.name = name
        self.CPF = CPF
        self.CNPJ = CNPJ
        self.phone = phone
    }
}

extension ConstructionManager: Migration { }
extension ConstructionManager: Content { }
extension ConstructionManager: Parameter { }

