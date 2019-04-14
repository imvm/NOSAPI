//
//  TransporterController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class TransporterController {
    func index(_ req: Request) throws -> Future<[Transporter]> {
        return Transporter.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<Transporter> {
        return try req.content.decode(Transporter.self).flatMap { transporter in
            return transporter.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Transporter.self).flatMap { transporter in
            return transporter.delete(on: req)
            }.transform(to: .ok)
    }
}
