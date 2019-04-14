//
//  TransportRequestController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class TransportRequestController {
    func index(_ req: Request) throws -> Future<[TransportRequest]> {
        return TransportRequest.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<TransportRequest> {
        return try req.content.decode(TransportRequest.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(TransportRequest.self).flatMap { todo in
            return todo.delete(on: req)
            }.transform(to: .ok)
    }
}
