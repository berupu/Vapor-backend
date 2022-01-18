//
//  File.swift
//  
//
//  Created by be RUPU on 29/10/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreatePlayerTrophy: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("player_trophy")
            .id()
            .field("player_id", .uuid, .required, .references("players", "id"))
            .field("trophy_id", .uuid, .required, .references("trophys", "id"))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("player_trophy").delete()
    }
}
