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
        return try req.content.decode(TransportRequest.self).flatMap { transportRequest in
            return transportRequest.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(TransportRequest.self).flatMap { transportRequest in
            return transportRequest.delete(on: req)
        }.transform(to: .ok)
    }
    
    // Return ticket as PDF document.
    func ticket(_ req: Request) throws -> Future<Data> {
        let transportRequestId = try req.parameters.next(Int.self)
        return TransportRequest.find(transportRequestId, on: req).map { transportRequest in
            guard let transportRequest = transportRequest else {
                throw Abort(.notFound)
            }
            
            let encoder = JSONEncoder()
            return try encoder.encode(transportRequest)
        }
    }
    
    // Set TransportRequest Status delivered == true.
    func deliver(_ req: Request) throws -> Future<TransportRequest> {
        let transportRequestId = try req.parameters.next(Int.self)
        return TransportRequest.find(transportRequestId, on: req).flatMap { transportRequest in
            guard let transportRequest = transportRequest else {
                throw Abort(.notFound)
            }
            
            
            transportRequest.delivered = true
            transportRequest.dateDelivered = Date()
            return transportRequest.save(on: req)
        }
    }
    
    // Cancel TransportRequest.
    func cancel(_ req: Request) throws -> Future<TransportRequest> {
        let transportRequestId = try req.parameters.next(Int.self)
        return TransportRequest.find(transportRequestId, on: req).flatMap { transportRequest in
            guard let transportRequest = transportRequest else {
                throw Abort(.notFound)
            }
            
            transportRequest.cancelled = true
            return transportRequest.save(on: req)
        }
    }
}
