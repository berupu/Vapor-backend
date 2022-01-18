import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "berupu"), as: .psql)
    
    app.migrations.add(CreatePlayers())
    app.migrations.add(CreateClub())
    app.migrations.add(CreateTrophy())
    app.migrations.add(AddUrlToPlayers())
    app.migrations.add(CreatePlayerTrophy())
    
    try routes(app)
}
