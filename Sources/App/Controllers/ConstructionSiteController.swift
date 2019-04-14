//
//  ConstructionSiteController.swift
//  App
//
//  Created by Ian Manor on 14/04/19.
//

import Vapor

final class ConstructionSiteController {
    func index(_ req: Request) throws -> Future<[ConstructionSite]> {
        return ConstructionSite.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<ConstructionSite> {
        return try req.content.decode(ConstructionSite.self).flatMap { constructionSite in
            return constructionSite.save(on: req)
        }
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(ConstructionSite.self).flatMap { constructionSite in
            return constructionSite.delete(on: req)
            }.transform(to: .ok)
    }
}
