//
//  Transporter.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import FluentPostgreSQL
import Vapor

final class Transporter: PostgreSQLModel {
    var id: Int?
    var transportRequests: [Int]? = []
    var name: String
    var CNPJ: String
    var phone: String
    var basePrice: Double
    var kilometerPrice: Double
    
    init(id: Int? = nil, name: String, CNPJ: String, phone: String, basePrice: Double, kilometerPrice: Double) {
        self.id = id
        self.name = name
        self.CNPJ = CNPJ
        self.phone = phone
        self.basePrice = basePrice
        self.kilometerPrice = kilometerPrice
    }
}

extension Transporter: Migration { }
extension Transporter: Content { }
extension Transporter: Parameter { }

