//
//  DestinationController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class DestinationController {
    func index(_ req: Request) throws -> Future<[Destination]> {
        return Destination.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<Destination> {
        return try req.content.decode(Destination.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Destination.self).flatMap { todo in
            return todo.delete(on: req)
            }.transform(to: .ok)
    }
}
