//
//  File.swift
//  
//
//  Created by be RUPU on 5/10/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreatePlayers: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("players") //table name
            .id()
            .field("playersname", .string) //column name
            .create()
    }

    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("players").delete()
    }
    
}
