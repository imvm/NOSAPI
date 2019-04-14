//
//  Address.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

struct Address: Codable {
    var streetAddress: String
    var number: String
    var neighbourhood: String
    var municipality: String
    var longitude: Double?
    var latitude: Double?
}
