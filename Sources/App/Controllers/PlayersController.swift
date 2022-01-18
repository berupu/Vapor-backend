
//
//  File.swift
//  
//
//  Created by be RUPU on 5/10/21.
//

import Foundation
import Vapor

final class  PlayersController {
    
    func create(_ req: Request) throws -> EventLoopFuture<Players>{
        let players = try req.content.decode(Players.self)
        return players.create(on: req.db).map{ players }
    }
    
    func all(_ req: Request) throws -> EventLoopFuture<[Players]> {
        Players.query(on: req.db).all()
    }

    func delete(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Players.find(req.parameters.get("playersid"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
    

}
