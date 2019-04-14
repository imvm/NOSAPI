import FluentPostgreSQL
import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
    try services.register(FluentPostgreSQLProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    // Configure a database
    let dbConfig: PostgreSQLDatabaseConfig
    if let url = Environment.get("HEROKU_POSTGRESQL_AQUA_URL"), let psqlConfig = PostgreSQLDatabaseConfig(url: url) {
        dbConfig = psqlConfig
    } else {
        dbConfig = PostgreSQLDatabaseConfig(hostname: "localhost", port: 5432, username: "postgres", database: "nos", password: nil)
    }
    let postgresql = PostgreSQLDatabase(config: dbConfig)
    
    /// Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: postgresql, as: .psql)
    services.register(databases)

    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Transporter.self, database: .psql)
    migrations.add(model: TransportRequest.self, database: .psql)
    migrations.add(model: Destination.self, database: .psql)
    migrations.add(model: ConstructionManager.self, database: .psql)
    migrations.add(model: ConstructionSite.self, database: .psql)
    migrations.add(model: RCCType.self, database: .psql)
    services.register(migrations)
    
    let leafProvider = LeafProvider()    // added
    try services.register(leafProvider)  // added
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
}
