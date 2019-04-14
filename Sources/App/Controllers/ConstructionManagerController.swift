//
//  ConstructionManagerController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class ConstructionManagerController {
    func index(_ req: Request) throws -> Future<[ConstructionManager]> {
        return ConstructionManager.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<ConstructionManager> {
        return try req.content.decode(ConstructionManager.self).flatMap { constructionManager in
            return constructionManager.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(ConstructionManager.self).flatMap { constructionManager in
            return constructionManager.delete(on: req)
            }.transform(to: .ok)
    }
}
