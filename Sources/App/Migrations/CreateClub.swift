//
//  File.swift
//  
//
//  Created by be RUPU on 12/10/21.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreateClub: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("clubs") //table name
            .id()
            .field("clubname", .string) //column name
            .field("playerid", .uuid,.required, .references(Players.schema, "id")) //this will connect through Players.id
            .create()
    }

    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema("clubs").delete()
    }
    
}
