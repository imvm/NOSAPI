//
//  RCCTypeController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class RCCTypeController {
    func index(_ req: Request) throws -> Future<[RCCType]> {
        return RCCType.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<RCCType> {
        return try req.content.decode(RCCType.self).flatMap { rccType in
            return rccType.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(RCCType.self).flatMap { rccType in
            return rccType.delete(on: req)
            }.transform(to: .ok)
    }
}
