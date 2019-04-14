import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get { req in
        return try req.view().render("home")
    }
    
    router.get("relatorio") { req in
        return TransportRequest.query(on: req).all().map { transportRequests -> EventLoopFuture<View> in
            struct TransportRequestsContext: Codable {
                var transportRequests: [TransportRequest]
            }
            
            let transportRequestsContext = TransportRequestsContext(transportRequests: transportRequests)
            return try req.view().render("relatorio", transportRequestsContext)
        }
    }
    
    router.get("geradores") { req in
        return ConstructionManager.query(on: req).all().map { constructionManagers -> EventLoopFuture<View> in
            struct ConstructionManagersContext: Codable {
                var constructionManagers: [ConstructionManager]
            }
            
            let constructionManagersContext = ConstructionManagersContext(constructionManagers: constructionManagers)
            return try req.view().render("geradores", constructionManagersContext)
        }
    }
    
    router.get("fretistas") { req in
        return Transporter.query(on: req).all().map { transporters -> EventLoopFuture<View> in
            struct TransportersContext: Codable {
                var transporters: [Transporter]
            }
            
            let transportersContext = TransportersContext(transporters: transporters)
            return try req.view().render("fretistas", transportersContext)
        }
    }
    
    router.get("destinos") { req in
        return Destination.query(on: req).all().map { destinations -> EventLoopFuture<View> in
            struct DestinationsContext: Codable {
                var destinations: [Destination]
            }
            
            let destinationsContext = DestinationsContext(destinations: destinations)
            return try req.view().render("destinos", destinationsContext)
        }
    }
    
    let transporterController = TransporterController()
    router.get("transporters", use: transporterController.index)
    router.post("transporters", use: transporterController.create)
    router.delete("transporters", Transporter.parameter, use: transporterController.delete)
    
    let transportRequestController = TransportRequestController()
    router.get("transportRequests", use: transportRequestController.index)
    router.post("transportRequests", use: transportRequestController.create)
    router.delete("transportRequests", TransportRequest.parameter, use: transportRequestController.delete)
    
    let constructionManagerController = ConstructionManagerController()
    router.get("constructionManagers", use: constructionManagerController.index)
    router.post("constructionManagers", use: constructionManagerController.create)
    router.delete("constructionManagers", ConstructionManager.parameter, use: constructionManagerController.delete)
    
    let constructionSiteController = ConstructionSiteController()
    router.get("constructionSites", use: constructionSiteController.index)
    router.post("constructionSites", use: constructionSiteController.create)
    router.delete("constructionSites", ConstructionSite.parameter, use: constructionSiteController.delete)
    
    let destinationController = DestinationController()
    router.get("destinations", use: destinationController.index)
    router.delete("destinations", Destination.parameter, use: destinationController.delete)
    
    let rccTypeController = RCCTypeController()
    router.get("rccTypes", use: rccTypeController.index)
    router.post("rccTypes", use: rccTypeController.create)
    router.delete("rccTypes", RCCType.parameter, use: rccTypeController.delete)
}
